defmodule MixLfe.MixProject do
  use Mix.Project

  @version "0.4.0"

  def project do
    [
      app: :mix_lfe,
      version: @version,
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      description: "A LFE compiler for Mix",
      compilers: Mix.compilers() ++ [:lfe],
      docs: [
        extras: ["README.md"],
        main: "readme",
        source_ref: "v#{@version}",
        source_url: "https://github.com/lfe/mix"
      ],
      package: package(),
      deps: deps()
    ]
  end

  def cli do
    [
      preferred_envs: ["lfe.test": :test]
    ]
  end

  def application do
    [extra_applications: [:logger, :eunit]]
  end

  def package do
    [
      name: "lfe_mix", # Note: the LFE community does not control the mix_lfe package on hex.pm
      licenses: ["Apache 2"],
      links: %{"GitHub" => "https://github.com/lfe/mix"},
      maintainers: ["Nikolay Tsvetinov (Meddle)", "John Goff", "Duncan McGreggor"]
    ]
  end

  def deps do
    [
      {:rebar3_lfe, git: "https://github.com/diasbruno/rebar3_lfe", tag: "paths", override: true},
      {:lfe, git: "https://github.com/diasbruno/lfe.git", tag: "ensure-directory-exists-before-writing-beam-file", app: false, override: true},
      {:ltest, "~> 0.13", compile: false, app: false},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end
end
