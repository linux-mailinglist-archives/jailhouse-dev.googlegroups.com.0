Return-Path: <jailhouse-dev+bncBC7PTOEB2ALRBAXW2WBQMGQE3X7AOUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x737.google.com (mail-qk1-x737.google.com [IPv6:2607:f8b0:4864:20::737])
	by mail.lfdr.de (Postfix) with ESMTPS id F33A735DD51
	for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Apr 2021 13:05:39 +0200 (CEST)
Received: by mail-qk1-x737.google.com with SMTP id c7sf10833533qka.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Apr 2021 04:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=BmBu8XdDfT7UXhnUKpdYV4vi8GkS5xBQOsDAvT25J7Y=;
        b=dB9BlGD2lsiEDrqp3nrZ9zPu6QL/SducOULCVAeBSq2IkyfZWaaCnMfWI3taFsRUlz
         ZeNTJvQOiFnksTvSJlK64udSjrGZAureyZjmGhvmJvYzF5D/mXWJ682SVDkqMDyJ2GwF
         g+oF+Fq0qsGq1PtZAaB/w8QAoimty26EJhuKcF/LYMpYfBCHpD8ubCWjgzOhdTCD+jhT
         9mZIVksAm9u/00eveha7zurIUpIpBO5tdT382s4ffPkyU0lDzb6hGhW3iAW2am4f/xCG
         /sXK/G+WiENkUX6hACuazHh/tYonTOFDc31E7W9zfRJloE8jkUsOII7dClZW3/GCPDkI
         kUnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=BmBu8XdDfT7UXhnUKpdYV4vi8GkS5xBQOsDAvT25J7Y=;
        b=m07W/V2WTo2zU3gLQVi5kxqSO85zdCmrC3WBJpjeQgl6btOtSnie8KGK8rv43pAWsD
         rXmVjg0q8O9AQetDaJj85peolDJscBlvc5G8LZUHF/+m/uQg7PHJbRBqJfe+iDEtjbQP
         00tg3Qmyxorr0ZwYk33JnoFadAsP1jouxGIRX7f4tJ+1CUGjf2JUmhH3MIu7876ONI/8
         Fm5QzuFTneXzDEsPKrO97Ewxk1y0AV693Ye1kOi2nFXlZ9/XgGMRGKuAtW0am+Sk6eis
         vmj9aNyl2JMEj8l7g5IsJuZYK0oxrA8rVvrRwQLSYeO3ofschLcLvcm+9HzIf4bG2LMw
         hcUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=BmBu8XdDfT7UXhnUKpdYV4vi8GkS5xBQOsDAvT25J7Y=;
        b=q97Nr/P8ien9gwcrWGSgMzC+S52HK6vEOrTYJ7e5XkjdCn4Fw01ECTD0WIsUfTdCqH
         TXAmmk/ehTp8lA1xVBzzyLki0SoicB0eBgsB34QPluO79adK00PfIQckwRyWVkkn5lT4
         cIUeOpN2nbj/COQcZGb0x8uH6XESc6H1dNtSrVa2k32mY0qzmleFt+hJNrTZ+/Nn5uXu
         rVeoPxxRXcJLCnKnnNpJJlSEA0suzar+lHvw3CO5TtIbiUvhq1QHcTkR1ZmgewnLwKid
         oG1Kqac5f9LRsm/w7f5Nq9kQ6/F+endqYw1PHlWsAAu5qJuw3iGmPO8Vr94J1FJ3+g5U
         YoLw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531bw5ZDnrBvGHx5ENSjM5BVjTv/xmmVBbF0Xj/Jvw+Wz6ziulyn
	Ic/XAVKcrdI4YsQn5b6jzHU=
X-Google-Smtp-Source: ABdhPJy0Ba0c40MuDd6d5NtyIEZalqUN2R/UwN5r9+xsALo+xGSJCzt0Rit7waag2VkZu/EtSzSThg==
X-Received: by 2002:a37:a990:: with SMTP id s138mr8380894qke.69.1618311938759;
        Tue, 13 Apr 2021 04:05:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:1011:: with SMTP id z17ls4252762qkj.6.gmail; Tue,
 13 Apr 2021 04:05:38 -0700 (PDT)
X-Received: by 2002:a37:46c5:: with SMTP id t188mr32476612qka.47.1618311937438;
        Tue, 13 Apr 2021 04:05:37 -0700 (PDT)
Date: Tue, 13 Apr 2021 04:05:36 -0700 (PDT)
From: Smith li <v6543210@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <e873be8e-2bf0-4d24-ac3e-13a7ce543b1dn@googlegroups.com>
In-Reply-To: <ef151dec-8123-b296-6a23-4a9827a68874@web.de>
References: <ec8b8710-e966-1abf-0f64-d9e10d7e005c@uni-tuebingen.de>
 <a588e2a5-b7cd-7df8-7341-2e7f9da79b6f@siemens.com>
 <2b64a2ef-970b-bc7c-6e7d-8dd3f9fcc5e1@uni-tuebingen.de>
 <ef151dec-8123-b296-6a23-4a9827a68874@web.de>
Subject: Re: autojail an automatic jailhouse configuration frontend for
 jailhouse on AARCH64 devices
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_224_1039879044.1618311936925"
X-Original-Sender: v6543210@gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

------=_Part_224_1039879044.1618311936925
Content-Type: multipart/alternative; 
	boundary="----=_Part_225_212118002.1618311936925"

------=_Part_225_212118002.1618311936925
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Do you know:=20
How to put pci device or gpio or network device into inmate for raspberry=
=20
pi 4b ?
I have never seen a sample for rpi4.  Only some for x86.
Can you help me?

=E5=9C=A82020=E5=B9=B48=E6=9C=8815=E6=97=A5=E6=98=9F=E6=9C=9F=E5=85=AD UTC+=
8 =E4=B8=8B=E5=8D=883:00:07<Jan Kiszka> =E5=86=99=E9=81=93=EF=BC=9A

> On 15.08.20 00:37, Christoph Gerum wrote:
> > Hi Jan,
> >
> > Am 14.08.2020 um 17:29 schrieb Jan Kiszka:
> >> Hi Christoph,
> >>
> >> On 14.08.20 10:58, Christoph Gerum wrote:
> >>> Over the last few months, our team has been working on an automatic
> >>> configuration utility for jailhouse. As our effort now nears a usable
> >>> state, we would like to present it to the jailhouse community.
> >>>
> >>> Our tooling is available on https://github.com/ekut-es/autojail
> >>>
> >>> The documentation is available on
> >>> https://atreus.informatik.uni-tuebingen.de/~gerum/autojail/
> >>>
> >>> The tooling works by extracting information about the target hardware
> >>> from the Linux runtime system (currently mainly
> >>> /sys/firmware/devicetree/),
> >>
> >> As you are processing a device tree already, can you also consume an
> >> offline dtb?
> >
> > We currently, are only processing the online device tree, as we want to
> > also know information from device tree overlays and dynamic device tree
> > nodes generated by kernel modules.
>
> Merging an overlay into a dtb while parsing it anyway is no black magic.
> Offline support would be a very valuable feature, like we've seen with
> the current config collector.
>
> But nodes generated by modules are unlikely to be relevant for Jailhouse
> - how should a module know more about the hardware than the device tree
> which is supposed to describe it? Can you give an example?
>
> >
> >> Did you also already have a look at system-dt
> >> (https://elinux.org/Device_tree_future#System_Device_Tree_2019.2C_2020
> )?
> >> That could become the next logical step for dt-based systems.
> >
> > I have not been aware of system-dt. It might be an interesting
> > possibility to completely avoid autojail specific configurations.
> >>> and then generating jailhouse cell configs
> >>> for root- and guest cells from a minimal configuration file.
> >>
> >> Important "detail": It comes with a new human-processable
> >> configuration format, you YAML schema, right? Is that format as
> >> powerful (or low-level) as the binary format, i.e. a full replacement
> >> of the current C files?
> >
> > The yml files currently are more or less a superset of the low-level
> > format. e.g. a memory region might look like:
> >
> >     memory_regions:
> >       "System RAM":
> >         physical_start_addr: 0x0
> >         virtual_start_addr: 0x0
> >         size: 1 GB
> >         flags: [MEM_READ, MEM_WRITE, MEM_EXECUTE]
> >
> > With a bit of syntactic sugar e.g. sizes can use human readable units,
> > no counting of memory_regions needed.
> >
> >> Or does it provide abstractions like
> >
> > Abstractions are currently implemented by making most entries optional:
> >
> >> "give me 1GB, I don't care where"
> >
> > would be:
> >
> >     memory_regions:
> >       "System RAM":
> >         size: 1 GB
> >         flags: [MEM_READ, MEM_WRITE, MEM_EXECUTE]
> >
> >
> >> "give me device B, with whatever I/O resources it comes"?
> >
> > This is currently expressed by the  device tree path:
> >
> >     memory_regions:
> >       gpio: /soc/gpiomem
> >
>
> These are interesting features!
>
> >
> >> How is the (planned) workflow then? Currently on x86, you call "config
> >> create" and then perform manual tuning on the resulting C config for
> >> the root cell to make it work. I suspect that is what "autojail
> >> extract" is about. In your case, tuning would be done on to the yml
> >> file? How would will the workflow be for non-root cell configs?
> >>
> >> Hint: Add a user story to your documents would help getting a big
> >> picture quicker.
> >
> > We have a different workflow and at least one user story per milestone:
> >
> > Assuming that we are able to connect to a target eval board via ssh.
> >
> > Milestone 1: Simplified config.
> >
> > autojail init
>
> I don't get the init step. From a user perspective, it looks useless and
> could be done internally when needed.
>
> > autojail extract
> >
> > manually create cells.yml to specifie the configuration. Guest cells ar=
e
> > created in the same cells.yml. e.g.:
> >
> > cells:
> >    root:
> >      name: "The Root Cell"
> >      type: root
> >      ...
> >
> >    guest1:
> >      name: "The first guest celll"
> >      type: linux
> >
> >
> >
> > autojail config
> >
> > manually test generated *.c configuration, and change cells.yml until i=
t
> > works.
> >
>
> Skip the c-file generation and emit binary configs directly. Way more
> user-friendly.
>
> That reminds me of Andrej's pending patches in my inbox which add that
> feature to pyjailhouse - you could simply use that once merged.
>
> >
> > Milestone 2: "jailhouse config create" on steroids
> >
> > At this milestone we wan't to allow the following use case:
> >
> > autojail init
> > autojail extract
> > autojail config --num-linux-guest 2 --memory-per-guest 128 MB
> > autojail deploy
> >
> > Then you should be able to ssh into the root cell and directly into eac=
h
> > guest and the root cell. Ideally with minimal, manual interventions.
> >
> > E.g we will configure ivshmem_net from root to each guest, and configur=
e
> > a bridge device or port forwarding in the root cell.
> >
> > Milestone 3+: Cell config management
> >
> > These have not fully finalized yet, but from Milestone 3 we intend to
> > use an extended cells.yml that supports fine tuning capabilities on par
> > with the current configuration format, while allowing tool support for
> > the fine tuning as well.
>
> If your config format is able express that, that would be a great
> progress. Say, you can request a complete device tree node, but then you
> can additionally define that a specific MMIO range of that device shall
> not be accessible.
>
> Stabilizing the config format for all these use cases will not be
> trivial, but it can be the way forward for Jailhouse.
>
> >
> >>> It differs from the current jailhouse config in the following ways:
> >>>
> >>
> >> I suspect you meant the current config generator
> > Yes, sorry.
> >
> >>>     - It targets aarch64 instead of x86_64.
> >>
> >> A final architecture will have to address all archs, even if the input
> >> for x86 will remain different.
> >
> > We don't have any plans to fully support X86 in autojail at the moment.
> > But I am considering integrating our device tree work into pyjailhouse
> > to allow jailhouse config create for ARM and AARCH64. At least as a
> > first step. But if our configuration file format would prove interestin=
g
> > as well, we might reconsider those plans.
>
> Definitely. Keep also in mind that our binary format is a moving target.
> So, even if you build consequently upon pyjailhouse for parsing and
> generating, you may have to rebase frequently when keeping things
> out-of-tree.
>
> >
> >>>     - It supports configuration of guest and root cells.
> >>>     - It allows a simplified configuration of IVSHMEM_NET.
> >>>
> >>> The current release has the following limitations, which we would lik=
e
> >>> to address in the coming weeks:
> >>>
> >>>     - No generation of configuration for the inmates (networking,
> >>> device-tree)
> >>>     - Dead Simple Memory allocator that will probably give up at a
> >>> relatively low memory pressure.
> >>
> >> Where does the memory allocator come into play?
> >
> > The static memory allocator currently allows us to leave out physical
> > and virtual addresses for the memory regions mapped to RAM. While
> > keeping some additional constraints: e.g. MEM_LOADABLE regions are adde=
d
> > to the root cell as well if their physical address range does not
> > overlap with any memory region already specified in the root cell.
>
> Got it - a valuable feature as well! Even more when coloring will come
> into play.
>
> >
> >>>     - Configuration of inter-cell communication is supported for
> >>> IVSHMEM_NET devices only
> >>>     - Only tested on Raspberry  PI 4B
> >>>     - No configuration of SMMU or other IOMMUs
> >>>
> >>> The current release has so far only been tested on Raspberry PI 4B, a=
nd
> >>> this announcement mainly is here as a request for comments, and to
> >>> evaluate how our work might fit into the general jailhouse ecosystem.
> >>>
> >>>     - Would there be interest to somehow integrate it more closely in=
to
> >>> the jailhouse ecosystem?
> >>>     - We would be very interested, if we could use it as a=20
> configuration
> >>> generator for the current work on memory coloring in jailhouse.
> >>
> >> Specifically coloring is a scenario where more tooling support for
> >> config generation and validation is needed, indeed. You may have seen
> >> that new "jailhouse config check" command which performs the latter
> >> (and should work with your approach as well as it processes binary
> >> configs), but we also need more of the former.
> >
> > One of the next points on my bucket list will be to directly integrate
> > jailhouse config check into our workflow. Would you be willing to accep=
t
> > patches to move the actual checks to pyjailhouse to allow an easier use
> > in external tooling.
>
> That is the purpose of pyjailhouse: Make functionality available for
> different frontends. So, yes.
>
> >
> >> So, yes, there is definitely interest in new ideas and concrete
> >> solutions, specifically for arm64 (though not only). After having to
> >> refactor configs/ recently, more than once, I would appreciate a lot
> >> if we could reduce the manual maintenance.
> >>
> >> What needs careful thoughts are the possible use cases and workflows.
> >> We need a solution that automates what can be safely automated,
> >> ideally warns when user input or validation is needed and does not
> >> stand in the way when manual tweaking must be applied. That is due to
> >> the low abstraction level of the binary config format the hypervisor
> >> consumes.
> >
> > One of our main goals is to be an experimentation field for finding the
> > right abstractions to allow an easy configuration, while still enabling
> > the fine tuning needed for more complex use cases.
>
> Sounds reasonable, also given what I wrote above. We need to find the
> right balance between downstream experimenting and upstream exposing (to
> more use cases), though.
>
> Jan
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e873be8e-2bf0-4d24-ac3e-13a7ce543b1dn%40googlegroups.com.

------=_Part_225_212118002.1618311936925
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Do you know:&nbsp;</div>How to put pci device or gpio or network devic=
e into inmate for raspberry pi 4b ?<div>I have never seen a sample for rpi4=
.&nbsp; Only some for x86.</div><div>Can you help me?<br><br></div><div cla=
ss=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">=E5=9C=A82020=E5=
=B9=B48=E6=9C=8815=E6=97=A5=E6=98=9F=E6=9C=9F=E5=85=AD UTC+8 =E4=B8=8B=E5=
=8D=883:00:07&lt;Jan Kiszka> =E5=86=99=E9=81=93=EF=BC=9A<br/></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px so=
lid rgb(204, 204, 204); padding-left: 1ex;">On 15.08.20 00:37, Christoph Ge=
rum wrote:
<br>&gt; Hi Jan,
<br>&gt;
<br>&gt; Am 14.08.2020 um 17:29 schrieb Jan Kiszka:
<br>&gt;&gt; Hi Christoph,
<br>&gt;&gt;
<br>&gt;&gt; On 14.08.20 10:58, Christoph Gerum wrote:
<br>&gt;&gt;&gt; Over the last few months, our team has been working on an =
automatic
<br>&gt;&gt;&gt; configuration utility for jailhouse. As our effort now nea=
rs a usable
<br>&gt;&gt;&gt; state, we would like to present it to the jailhouse commun=
ity.
<br>&gt;&gt;&gt;
<br>&gt;&gt;&gt; Our tooling is available on <a href=3D"https://github.com/=
ekut-es/autojail" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://github.com/ekut-e=
s/autojail&amp;source=3Dgmail&amp;ust=3D1618398029225000&amp;usg=3DAFQjCNHi=
Lcv7I_sIe5hja9zaCQ22YB_yhg">https://github.com/ekut-es/autojail</a>
<br>&gt;&gt;&gt;
<br>&gt;&gt;&gt; The documentation is available on
<br>&gt;&gt;&gt; <a href=3D"https://atreus.informatik.uni-tuebingen.de/~ger=
um/autojail/" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"ht=
tps://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://atreus.informatik.uni-t=
uebingen.de/~gerum/autojail/&amp;source=3Dgmail&amp;ust=3D1618398029225000&=
amp;usg=3DAFQjCNFajkG84_11ZOijUbDu-cZ0K1JhzQ">https://atreus.informatik.uni=
-tuebingen.de/~gerum/autojail/</a>
<br>&gt;&gt;&gt;
<br>&gt;&gt;&gt; The tooling works by extracting information about the targ=
et hardware
<br>&gt;&gt;&gt; from the Linux runtime system (currently mainly
<br>&gt;&gt;&gt; /sys/firmware/devicetree/),
<br>&gt;&gt;
<br>&gt;&gt; As you are processing a device tree already, can you also cons=
ume an
<br>&gt;&gt; offline dtb?
<br>&gt;
<br>&gt; We currently, are only processing the online device tree, as we wa=
nt to
<br>&gt; also know information from device tree overlays and dynamic device=
 tree
<br>&gt; nodes generated by kernel modules.
<br>
<br>Merging an overlay into a dtb while parsing it anyway is no black magic=
.
<br>Offline support would be a very valuable feature, like we&#39;ve seen w=
ith
<br>the current config collector.
<br>
<br>But nodes generated by modules are unlikely to be relevant for Jailhous=
e
<br>- how should a module know more about the hardware than the device tree
<br>which is supposed to describe it? Can you give an example?
<br>
<br>&gt;
<br>&gt;&gt; Did you also already have a look at system-dt
<br>&gt;&gt; (<a href=3D"https://elinux.org/Device_tree_future#System_Devic=
e_Tree_2019.2C_2020" target=3D"_blank" rel=3D"nofollow" data-saferedirectur=
l=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://elinux.org/Devic=
e_tree_future%23System_Device_Tree_2019.2C_2020&amp;source=3Dgmail&amp;ust=
=3D1618398029225000&amp;usg=3DAFQjCNFoyC_AToodleLh4vXEDvJTI9vUcw">https://e=
linux.org/Device_tree_future#System_Device_Tree_2019.2C_2020</a>)?
<br>&gt;&gt; That could become the next logical step for dt-based systems.
<br>&gt;
<br>&gt; I have not been aware of system-dt. It might be an interesting
<br>&gt; possibility to completely avoid autojail specific configurations.
<br>&gt;&gt;&gt; and then generating jailhouse cell configs
<br>&gt;&gt;&gt; for root- and guest cells from a minimal configuration fil=
e.
<br>&gt;&gt;
<br>&gt;&gt; Important &quot;detail&quot;: It comes with a new human-proces=
sable
<br>&gt;&gt; configuration format, you YAML schema, right? Is that format a=
s
<br>&gt;&gt; powerful (or low-level) as the binary format, i.e. a full repl=
acement
<br>&gt;&gt; of the current C files?
<br>&gt;
<br>&gt; The yml files currently are more or less a superset of the low-lev=
el
<br>&gt; format. e.g. a memory region might look like:
<br>&gt;
<br>&gt;  =C2=A0=C2=A0=C2=A0 memory_regions:
<br>&gt;  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;System RAM&quot;:
<br>&gt;  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 physical_start_addr: 0=
x0
<br>&gt;  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 virtual_start_addr: 0x=
0
<br>&gt;  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size: 1 GB
<br>&gt;  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags: [MEM_READ, MEM_=
WRITE, MEM_EXECUTE]
<br>&gt;
<br>&gt; With a bit of syntactic sugar e.g. sizes can use human readable un=
its,
<br>&gt; no counting of memory_regions needed.
<br>&gt;
<br>&gt;&gt; Or does it provide abstractions like
<br>&gt;
<br>&gt; Abstractions are currently implemented by making most entries opti=
onal:
<br>&gt;
<br>&gt;&gt; &quot;give me 1GB, I don&#39;t care where&quot;
<br>&gt;
<br>&gt; would be:
<br>&gt;
<br>&gt;  =C2=A0=C2=A0=C2=A0 memory_regions:
<br>&gt;  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;System RAM&quot;:
<br>&gt;  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size: 1 GB
<br>&gt;  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags: [MEM_READ, MEM_=
WRITE, MEM_EXECUTE]
<br>&gt;
<br>&gt;
<br>&gt;&gt; &quot;give me device B, with whatever I/O resources it comes&q=
uot;?
<br>&gt;
<br>&gt; This is currently expressed by the=C2=A0 device tree path:
<br>&gt;
<br>&gt;  =C2=A0=C2=A0=C2=A0 memory_regions:
<br>&gt;  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpio: /soc/gpiomem
<br>&gt;
<br>
<br>These are interesting features!
<br>
<br>&gt;
<br>&gt;&gt; How is the (planned) workflow then? Currently on x86, you call=
 &quot;config
<br>&gt;&gt; create&quot; and then perform manual tuning on the resulting C=
 config for
<br>&gt;&gt; the root cell to make it work. I suspect that is what &quot;au=
tojail
<br>&gt;&gt; extract&quot; is about. In your case, tuning would be done on =
to the yml
<br>&gt;&gt; file? How would will the workflow be for non-root cell configs=
?
<br>&gt;&gt;
<br>&gt;&gt; Hint: Add a user story to your documents would help getting a =
big
<br>&gt;&gt; picture quicker.
<br>&gt;
<br>&gt; We have a different workflow and at least one user story per miles=
tone:
<br>&gt;
<br>&gt; Assuming that we are able to connect to a target eval board via ss=
h.
<br>&gt;
<br>&gt; Milestone 1: Simplified config.
<br>&gt;
<br>&gt; autojail init
<br>
<br>I don&#39;t get the init step. From a user perspective, it looks useles=
s and
<br>could be done internally when needed.
<br>
<br>&gt; autojail extract
<br>&gt;
<br>&gt; manually create cells.yml to specifie the configuration. Guest cel=
ls are
<br>&gt; created in the same cells.yml. e.g.:
<br>&gt;
<br>&gt; cells:
<br>&gt;  =C2=A0=C2=A0 root:
<br>&gt;  =C2=A0=C2=A0=C2=A0=C2=A0 name: &quot;The Root Cell&quot;
<br>&gt;  =C2=A0=C2=A0=C2=A0=C2=A0 type: root
<br>&gt;  =C2=A0=C2=A0=C2=A0=C2=A0 ...
<br>&gt;
<br>&gt;  =C2=A0=C2=A0 guest1:
<br>&gt;  =C2=A0=C2=A0=C2=A0=C2=A0 name: &quot;The first guest celll&quot;
<br>&gt;  =C2=A0=C2=A0=C2=A0=C2=A0 type: linux
<br>&gt;
<br>&gt;
<br>&gt;
<br>&gt; autojail config
<br>&gt;
<br>&gt; manually test generated *.c configuration, and change cells.yml un=
til it
<br>&gt; works.
<br>&gt;
<br>
<br>Skip the c-file generation and emit binary configs directly. Way more
<br>user-friendly.
<br>
<br>That reminds me of Andrej&#39;s pending patches in my inbox which add t=
hat
<br>feature to pyjailhouse - you could simply use that once merged.
<br>
<br>&gt;
<br>&gt; Milestone 2: &quot;jailhouse config create&quot; on steroids
<br>&gt;
<br>&gt; At this milestone we wan&#39;t to allow the following use case:
<br>&gt;
<br>&gt; autojail init
<br>&gt; autojail extract
<br>&gt; autojail config --num-linux-guest 2 --memory-per-guest 128 MB
<br>&gt; autojail deploy
<br>&gt;
<br>&gt; Then you should be able to ssh into the root cell and directly int=
o each
<br>&gt; guest and the root cell. Ideally with minimal, manual intervention=
s.
<br>&gt;
<br>&gt; E.g we will configure ivshmem_net from root to each guest, and con=
figure
<br>&gt; a bridge device or port forwarding in the root cell.
<br>&gt;
<br>&gt; Milestone 3+: Cell config management
<br>&gt;
<br>&gt; These have not fully finalized yet, but from Milestone 3 we intend=
 to
<br>&gt; use an extended cells.yml that supports fine tuning capabilities o=
n par
<br>&gt; with the current configuration format, while allowing tool support=
 for
<br>&gt; the fine tuning as well.
<br>
<br>If your config format is able express that, that would be a great
<br>progress. Say, you can request a complete device tree node, but then yo=
u
<br>can additionally define that a specific MMIO range of that device shall
<br>not be accessible.
<br>
<br>Stabilizing the config format for all these use cases will not be
<br>trivial, but it can be the way forward for Jailhouse.
<br>
<br>&gt;
<br>&gt;&gt;&gt; It differs from the current jailhouse config in the follow=
ing ways:
<br>&gt;&gt;&gt;
<br>&gt;&gt;
<br>&gt;&gt; I suspect you meant the current config generator
<br>&gt; Yes, sorry.
<br>&gt;
<br>&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 - It targets aarch64 instead of x86_64.
<br>&gt;&gt;
<br>&gt;&gt; A final architecture will have to address all archs, even if t=
he input
<br>&gt;&gt; for x86 will remain different.
<br>&gt;
<br>&gt; We don&#39;t have any plans to fully support X86 in autojail at th=
e moment.
<br>&gt; But I am considering integrating our device tree work into pyjailh=
ouse
<br>&gt; to allow jailhouse config create for ARM and AARCH64. At least as =
a
<br>&gt; first step. But if our configuration file format would prove inter=
esting
<br>&gt; as well, we might reconsider those plans.
<br>
<br>Definitely. Keep also in mind that our binary format is a moving target=
.
<br>So, even if you build consequently upon pyjailhouse for parsing and
<br>generating, you may have to rebase frequently when keeping things
<br>out-of-tree.
<br>
<br>&gt;
<br>&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 - It supports configuration of guest an=
d root cells.
<br>&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 - It allows a simplified configuration =
of IVSHMEM_NET.
<br>&gt;&gt;&gt;
<br>&gt;&gt;&gt; The current release has the following limitations, which w=
e would like
<br>&gt;&gt;&gt; to address in the coming weeks:
<br>&gt;&gt;&gt;
<br>&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 - No generation of configuration for th=
e inmates (networking,
<br>&gt;&gt;&gt; device-tree)
<br>&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 - Dead Simple Memory allocator that wil=
l probably give up at a
<br>&gt;&gt;&gt; relatively low memory pressure.
<br>&gt;&gt;
<br>&gt;&gt; Where does the memory allocator come into play?
<br>&gt;
<br>&gt; The static memory allocator currently allows us to leave out physi=
cal
<br>&gt; and virtual addresses for the memory regions mapped to RAM. While
<br>&gt; keeping some additional constraints: e.g. MEM_LOADABLE regions are=
 added
<br>&gt; to the root cell as well if their physical address range does not
<br>&gt; overlap with any memory region already specified in the root cell.
<br>
<br>Got it - a valuable feature as well! Even more when coloring will come
<br>into play.
<br>
<br>&gt;
<br>&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 - Configuration of inter-cell communica=
tion is supported for
<br>&gt;&gt;&gt; IVSHMEM_NET devices only
<br>&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 - Only tested on Raspberry=C2=A0 PI 4B
<br>&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 - No configuration of SMMU or other IOM=
MUs
<br>&gt;&gt;&gt;
<br>&gt;&gt;&gt; The current release has so far only been tested on Raspber=
ry PI 4B, and
<br>&gt;&gt;&gt; this announcement mainly is here as a request for comments=
, and to
<br>&gt;&gt;&gt; evaluate how our work might fit into the general jailhouse=
 ecosystem.
<br>&gt;&gt;&gt;
<br>&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 - Would there be interest to somehow in=
tegrate it more closely into
<br>&gt;&gt;&gt; the jailhouse ecosystem?
<br>&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 - We would be very interested, if we co=
uld use it as a configuration
<br>&gt;&gt;&gt; generator for the current work on memory coloring in jailh=
ouse.
<br>&gt;&gt;
<br>&gt;&gt; Specifically coloring is a scenario where more tooling support=
 for
<br>&gt;&gt; config generation and validation is needed, indeed. You may ha=
ve seen
<br>&gt;&gt; that new &quot;jailhouse config check&quot; command which perf=
orms the latter
<br>&gt;&gt; (and should work with your approach as well as it processes bi=
nary
<br>&gt;&gt; configs), but we also need more of the former.
<br>&gt;
<br>&gt; One of the next points on my bucket list will be to directly integ=
rate
<br>&gt; jailhouse config check into our workflow. Would you be willing to =
accept
<br>&gt; patches to move the actual checks to pyjailhouse to allow an easie=
r use
<br>&gt; in external tooling.
<br>
<br>That is the purpose of pyjailhouse: Make functionality available for
<br>different frontends. So, yes.
<br>
<br>&gt;
<br>&gt;&gt; So, yes, there is definitely interest in new ideas and concret=
e
<br>&gt;&gt; solutions, specifically for arm64 (though not only). After hav=
ing to
<br>&gt;&gt; refactor configs/ recently, more than once, I would appreciate=
 a lot
<br>&gt;&gt; if we could reduce the manual maintenance.
<br>&gt;&gt;
<br>&gt;&gt; What needs careful thoughts are the possible use cases and wor=
kflows.
<br>&gt;&gt; We need a solution that automates what can be safely automated=
,
<br>&gt;&gt; ideally warns when user input or validation is needed and does=
 not
<br>&gt;&gt; stand in the way when manual tweaking must be applied. That is=
 due to
<br>&gt;&gt; the low abstraction level of the binary config format the hype=
rvisor
<br>&gt;&gt; consumes.
<br>&gt;
<br>&gt; One of our main goals is to be an experimentation field for findin=
g the
<br>&gt; right abstractions to allow an easy configuration, while still ena=
bling
<br>&gt; the fine tuning needed for more complex use cases.
<br>
<br>Sounds reasonable, also given what I wrote above. We need to find the
<br>right balance between downstream experimenting and upstream exposing (t=
o
<br>more use cases), though.
<br>
<br>Jan
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/e873be8e-2bf0-4d24-ac3e-13a7ce543b1dn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/e873be8e-2bf0-4d24-ac3e-13a7ce543b1dn%40googlegroups.co=
m</a>.<br />

------=_Part_225_212118002.1618311936925--

------=_Part_224_1039879044.1618311936925--
