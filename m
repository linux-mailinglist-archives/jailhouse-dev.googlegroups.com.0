Return-Path: <jailhouse-dev+bncBCONRR6ZTUGRBBFE3T4QKGQE6XTZ23A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63c.google.com (mail-ej1-x63c.google.com [IPv6:2a00:1450:4864:20::63c])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FE1244FE2
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Aug 2020 00:36:53 +0200 (CEST)
Received: by mail-ej1-x63c.google.com with SMTP id lg2sf3805463ejb.23
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Aug 2020 15:36:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597444613; cv=pass;
        d=google.com; s=arc-20160816;
        b=TJcppji9YejkLDukWrmwTxE98Fap/33Hu+OONzCC7Ss5uY9jCKl1WW2tUuoTYC8IOB
         Z75ffUSFvFiIIEbGeicrCOUV2cORL6KGEDfac1Ahw8Ad9u4/YxZ44EGpPw2iAqVjTTMh
         x/REHXeaXoK/Tirw4+5UDutIY/reT4CFF+YFHgd73zzg2fmsbI9f6PKMmZI7srNK9kaK
         DgWDIL7oAQDjs71TnGqs41lhzReH3PdzYZwj/w+aoLm9HE7HFVM0QTPCiMhuVkc9hhJ7
         4aR5NJJnO7lX/x+UtKggCCgVTOajLsvuP9fc1Cc+Aoey5qk3Id6Hh6z67txy9RImksti
         beog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject:sender:dkim-signature;
        bh=fkSTx66ZWZ5rW874xGUZyEQikS6YsUmhxqdB1HaGxS0=;
        b=g2Svs1NTrLvUwZMQQKfNTjtvVCo2MULJi5JCLwGhe9h/GQcBw+YdQyU0hP5w3Y8B3+
         v6IyEWBpLJjKUlifcryeQf0ueXeoeu5N/aMTTioD0u/+w154cpdZAuY4w7KEvgX3uCZM
         sPInYYbRCKL+8AQh5wM5jupOzb9bSJ4ObZKFA2G27P4AoHqQOLjrVJCInCLjKEDqoRH2
         a9TirV4nfltD0dewH3fgu00AYm2UwA58gZsrdC6ooLH/62juC1EwRwb3x9gPcZas1rGR
         2jDFsFDhoYors/UmGXmxla3enlQT6U6K9bXVz82Sm5jdhqleWq0YmOA4R1dAVYm0GSIY
         Sxqw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of christoph.gerum@uni-tuebingen.de designates 134.2.5.214 as permitted sender) smtp.mailfrom=christoph.gerum@uni-tuebingen.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fkSTx66ZWZ5rW874xGUZyEQikS6YsUmhxqdB1HaGxS0=;
        b=VorzDc2Uq+toQf8kN1hKCLzyl7MLMI1KShu3YqXg4HFMVcyoeaRF5JJ4XdLiL0eqYr
         bdN8AKtLWX2ImjuRpz3WnJE5ix0tPo/Og6ZuKRAyrCox5c2hdBb8sl5sepeHwgE19p/Z
         52hLXXb2WU2OQ7FMygRkSrJTovzp/MQN+7ulvosBaO5L7t4tdjXozmA8evrcguKjzTXe
         OiNX9cMRnWZOBbRNOkMdNA4M6j/0GTws84sLpCm9dG4wm/X8nfzwaqp/pfuFUKHzbvv0
         htft1O0b4/Ukx/2GonTzI8Sy2GRgg0cxmXV8FyFZmZ5J/F9SLFbXhIqZ2Q1lpGDeCOWH
         gKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=fkSTx66ZWZ5rW874xGUZyEQikS6YsUmhxqdB1HaGxS0=;
        b=XRqa1gb+P36IfXftQnUnU5Y7APps4DXMk6VBl9u4JHfYP27oHMMXb6NJZYoycORgfN
         /718wEzRgMItqfc/GLgugbthOT/HG//wh+wrpsFTwzHBlT3La/NTFGuMkihir0yinlLj
         Le3nCFhIz9a/xFaxHdZNj3kOTsOKYTFx1Lum5pnKJ0uofmN2yso2DenPS9Hz3P6HzXPI
         qn5mS5A7tLYPH/kSYSg+XdNR5143fBmkn0D5ycnKNB96wtsHjLom/u3qQ680HZSe+8iO
         geYR0a0tE5hpGi+jTd/yRBgUInN8ccoI3zVO5IvxM7rxY2ijnNKDFGIfkp0dr5W68klW
         87oA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Q/KIckCMjVSSZrxkHQcAfGs6sEKvOQ3KfNkB8wbgeSNyvCwl0
	UAqapReQZBL+n8Gy4NzatPY=
X-Google-Smtp-Source: ABdhPJxhtGBJAZSEmtXfXXVM2z12m8apa2YDTpZsHdtgBuNsfXEQz7Qw2Y3MZGRCDShSswsvPThhkw==
X-Received: by 2002:a17:906:4157:: with SMTP id l23mr4441901ejk.491.1597444613198;
        Fri, 14 Aug 2020 15:36:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:cb95:: with SMTP id mf21ls4980662ejb.9.gmail; Fri,
 14 Aug 2020 15:36:52 -0700 (PDT)
X-Received: by 2002:a17:906:7e0b:: with SMTP id e11mr4811070ejr.540.1597444612233;
        Fri, 14 Aug 2020 15:36:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597444612; cv=none;
        d=google.com; s=arc-20160816;
        b=QXHF48y4qEaEkhxS9+iNVC7mSymEgZMXv/4/ytNvcw9mzPTpXPC0PLoKnk4cQkfFCY
         02sGAjsdf9ZgKRsQpFjC/gk6BIRWK4HS68jgIovsLqqR0JigDTUbixBMiRHh3G+wBBl2
         0C7cOVJqq2wKYqHL9lho+ntwVaQ0EDfHOAyNPMAYnF4jJmhqEPSgTpGQC22jqAgw66py
         zrcowu0fXSSN+yyYKf5NNoYK9H6970PqJZ94FDAOHqbWtdHGtN0CPTHc6VoWDA1xx+3e
         gt1Hx+CiZcxsl/koS25/NDhFB4mE2Gs39Qnq7YuCsEI3Qey4Yub3bUja05/05nLoQDPI
         rs2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=34di5jEAFtOrVspB90qArhPBQZswlky4FjFISPv5Rro=;
        b=chEdH4lyUkW87JZ8uc56RRx3Dq31GVDWIsrBk0W3kkn0siPZe1Ym8ZbhJgUiZ0WqpD
         F4X7A0ywS/mg1GHR76Ph0vdK+ndwIAEAzscX6y+BR5F1k4WEv6R7jCun/y1BbdXDukdG
         krgK7py/6KmdXDwz/B5G2tF4RZSbbfd4ECV46SYKb5yNk48nUt+uAktvUQ45IUAz2WfN
         QmgXxs61wzw4pY3r6dT8f9P5ZjygjEmgYc36WI4o9kDdXx09rqUSyssN3iciyECjWTFo
         JZfdf56wckweCMSfuES2A6fwW03cth0Y/PKLGFk6FvUiHyyJvQ2nVkHa556JbjnHFKzv
         12fQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of christoph.gerum@uni-tuebingen.de designates 134.2.5.214 as permitted sender) smtp.mailfrom=christoph.gerum@uni-tuebingen.de
Received: from mx04.uni-tuebingen.de (mx04.uni-tuebingen.de. [134.2.5.214])
        by gmr-mx.google.com with ESMTPS id q14si405472ejo.0.2020.08.14.15.36.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Aug 2020 15:36:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of christoph.gerum@uni-tuebingen.de designates 134.2.5.214 as permitted sender) client-ip=134.2.5.214;
Received: from [192.168.178.43] (x4d0c2054.dyn.telefonica.de [77.12.32.84])
	by mx04.uni-tuebingen.de (Postfix) with ESMTPSA id C5A824A92A;
	Sat, 15 Aug 2020 00:36:51 +0200 (CEST)
Subject: Re: autojail an automatic jailhouse configuration frontend for
 jailhouse on AARCH64 devices
To: Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com
References: <ec8b8710-e966-1abf-0f64-d9e10d7e005c@uni-tuebingen.de>
 <a588e2a5-b7cd-7df8-7341-2e7f9da79b6f@siemens.com>
From: Christoph Gerum <christoph.gerum@uni-tuebingen.de>
Message-ID: <2b64a2ef-970b-bc7c-6e7d-8dd3f9fcc5e1@uni-tuebingen.de>
Date: Sat, 15 Aug 2020 00:37:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <a588e2a5-b7cd-7df8-7341-2e7f9da79b6f@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: christoph.gerum@uni-tuebingen.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of christoph.gerum@uni-tuebingen.de designates
 134.2.5.214 as permitted sender) smtp.mailfrom=christoph.gerum@uni-tuebingen.de
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

Hi Jan,

Am 14.08.2020 um 17:29 schrieb Jan Kiszka:
> Hi Christoph,
>=20
> On 14.08.20 10:58, Christoph Gerum wrote:
>> Over the last few months, our team has been working on an automatic
>> configuration utility for jailhouse. As our effort now nears a usable
>> state, we would like to present it to the jailhouse community.
>>
>> Our tooling is available on https://github.com/ekut-es/autojail
>>
>> The documentation is available on
>> https://atreus.informatik.uni-tuebingen.de/~gerum/autojail/
>>
>> The tooling works by extracting information about the target hardware
>> from the Linux runtime system (currently mainly
>> /sys/firmware/devicetree/),
>=20
> As you are processing a device tree already, can you also consume an=20
> offline dtb?

We currently, are only processing the online device tree, as we want to=20
also know information from device tree overlays and dynamic device tree=20
nodes generated by kernel modules.

> Did you also already have a look at system-dt=20
> (https://elinux.org/Device_tree_future#System_Device_Tree_2019.2C_2020)?=
=20
> That could become the next logical step for dt-based systems.

I have not been aware of system-dt. It might be an interesting=20
possibility to completely avoid autojail specific configurations.
>> and then generating jailhouse cell configs
>> for root- and guest cells from a minimal configuration file.
>=20
> Important "detail": It comes with a new human-processable configuration=
=20
> format, you YAML schema, right? Is that format as powerful (or=20
> low-level) as the binary format, i.e. a full replacement of the current=
=20
> C files?

The yml files currently are more or less a superset of the low-level=20
format. e.g. a memory region might look like:

     memory_regions:
       "System RAM":
         physical_start_addr: 0x0
         virtual_start_addr: 0x0
         size: 1 GB
         flags: [MEM_READ, MEM_WRITE, MEM_EXECUTE]

With a bit of syntactic sugar e.g. sizes can use human readable units,=20
no counting of memory_regions needed.

> Or does it provide abstractions like=20

Abstractions are currently implemented by making most entries optional:

> "give me 1GB, I don't care where"=20

would be:

     memory_regions:
       "System RAM":
         size: 1 GB
         flags: [MEM_READ, MEM_WRITE, MEM_EXECUTE]


> "give me device B, with whatever I/O resources it comes"?

This is currently expressed by the  device tree path:

     memory_regions:
       gpio: /soc/gpiomem


> How is the (planned) workflow then? Currently on x86, you call "config=20
> create" and then perform manual tuning on the resulting C config for the=
=20
> root cell to make it work. I suspect that is what "autojail extract" is=
=20
> about. In your case, tuning would be done on to the yml file? How would=
=20
> will the workflow be for non-root cell configs?
>=20
> Hint: Add a user story to your documents would help getting a big=20
> picture quicker.

We have a different workflow and at least one user story per milestone:

Assuming that we are able to connect to a target eval board via ssh.

Milestone 1: Simplified config.

autojail init
autojail extract

manually create cells.yml to specifie the configuration. Guest cells are=20
created in the same cells.yml. e.g.:

cells:
    root:
      name: "The Root Cell"
      type: root
      ...

    guest1:
      name: "The first guest celll"
      type: linux



autojail config

manually test generated *.c configuration, and change cells.yml until it=20
works.


Milestone 2: "jailhouse config create" on steroids

At this milestone we wan't to allow the following use case:

autojail init
autojail extract
autojail config --num-linux-guest 2 --memory-per-guest 128 MB
autojail deploy

Then you should be able to ssh into the root cell and directly into each=20
guest and the root cell. Ideally with minimal, manual interventions.

E.g we will configure ivshmem_net from root to each guest, and configure=20
a bridge device or port forwarding in the root cell.

Milestone 3+: Cell config management

These have not fully finalized yet, but from Milestone 3 we intend to=20
use an extended cells.yml that supports fine tuning capabilities on par=20
with the current configuration format, while allowing tool support for=20
the fine tuning as well.

>> It differs from the current jailhouse config in the following ways:
>>
>=20
> I suspect you meant the current config generator
Yes, sorry.

>> =C2=A0=C2=A0=C2=A0 - It targets aarch64 instead of x86_64.
>=20
> A final architecture will have to address all archs, even if the input=20
> for x86 will remain different.

We don't have any plans to fully support X86 in autojail at the moment.=20
But I am considering integrating our device tree work into pyjailhouse=20
to allow jailhouse config create for ARM and AARCH64. At least as a=20
first step. But if our configuration file format would prove interesting=20
as well, we might reconsider those plans.

>> =C2=A0=C2=A0=C2=A0 - It supports configuration of guest and root cells.
>> =C2=A0=C2=A0=C2=A0 - It allows a simplified configuration of IVSHMEM_NET=
.
>>
>> The current release has the following limitations, which we would like
>> to address in the coming weeks:
>>
>> =C2=A0=C2=A0=C2=A0 - No generation of configuration for the inmates (net=
working,
>> device-tree)
>> =C2=A0=C2=A0=C2=A0 - Dead Simple Memory allocator that will probably giv=
e up at a
>> relatively low memory pressure.
>=20
> Where does the memory allocator come into play?

The static memory allocator currently allows us to leave out physical=20
and virtual addresses for the memory regions mapped to RAM. While=20
keeping some additional constraints: e.g. MEM_LOADABLE regions are added=20
to the root cell as well if their physical address range does not=20
overlap with any memory region already specified in the root cell.

>> =C2=A0=C2=A0=C2=A0 - Configuration of inter-cell communication is suppor=
ted for
>> IVSHMEM_NET devices only
>> =C2=A0=C2=A0=C2=A0 - Only tested on Raspberry=C2=A0 PI 4B
>> =C2=A0=C2=A0=C2=A0 - No configuration of SMMU or other IOMMUs
>>
>> The current release has so far only been tested on Raspberry PI 4B, and
>> this announcement mainly is here as a request for comments, and to
>> evaluate how our work might fit into the general jailhouse ecosystem.
>>
>> =C2=A0=C2=A0=C2=A0 - Would there be interest to somehow integrate it mor=
e closely into
>> the jailhouse ecosystem?
>> =C2=A0=C2=A0=C2=A0 - We would be very interested, if we could use it as =
a configuration
>> generator for the current work on memory coloring in jailhouse.
>=20
> Specifically coloring is a scenario where more tooling support for=20
> config generation and validation is needed, indeed. You may have seen=20
> that new "jailhouse config check" command which performs the latter (and=
=20
> should work with your approach as well as it processes binary configs),=
=20
> but we also need more of the former.

One of the next points on my bucket list will be to directly integrate=20
jailhouse config check into our workflow. Would you be willing to accept=20
patches to move the actual checks to pyjailhouse to allow an easier use=20
in external tooling.

> So, yes, there is definitely interest in new ideas and concrete=20
> solutions, specifically for arm64 (though not only). After having to=20
> refactor configs/ recently, more than once, I would appreciate a lot if=
=20
> we could reduce the manual maintenance.
>=20
> What needs careful thoughts are the possible use cases and workflows. We=
=20
> need a solution that automates what can be safely automated, ideally=20
> warns when user input or validation is needed and does not stand in the=
=20
> way when manual tweaking must be applied. That is due to the low=20
> abstraction level of the binary config format the hypervisor consumes.

One of our main goals is to be an experimentation field for finding the=20
right abstractions to allow an easy configuration, while still enabling=20
the fine tuning needed for more complex use cases.

Christoph

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/2b64a2ef-970b-bc7c-6e7d-8dd3f9fcc5e1%40uni-tuebingen.de.
