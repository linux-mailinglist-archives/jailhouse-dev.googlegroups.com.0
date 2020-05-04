Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBF6HYH2QKGQE5RWZHYY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D871C464B
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 May 2020 20:48:56 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id de17sf3606224edb.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 May 2020 11:48:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588618136; cv=pass;
        d=google.com; s=arc-20160816;
        b=s42YHyMc+Lvm0zcwWrHJod5Eq+9nTozjei1aDXzSJawBLuV2xgCc+O3qvDMViizSv3
         cmysCQJ1akZyQ6VpMbktqw/X1bbvaDkeq3aTp8C5OOIby0IEeVG7+S87QXWrB2AvuJjL
         IsQ7N994DkfwW0NqdxWC977CzQbokIZM9/WliCjzDaghBhJUg/A/1XqZDuRfKkbH773j
         f3/Huk1Uglcr7kISb2WE0+sjkx6DJLhCz9rDbwyqAtwyjFWTp757+LXzpG5colmRvuDr
         tnOqOsNfyZBRRWRKp3Nsi5z8gvIEylNWXqRi1O/rqW8E87tmmy7CrZyWIK6pJjtpvjzp
         qtew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=LC2STsRDtTHQH+0n6h0zR4t4XXF6wi7gwkPfjxXX7qA=;
        b=dyTstXRzRTcZM/5BcKDkfwfCHyMp0r26kjBjEQ7p1n4HhJVEOWGVGGRfrh+iuoZLJY
         k31TRv2iTdbnTNQ7iuXYmYks/7p3b6gS4Rh5hZmKouqT7AbZXyd0uJ2JBKYl+DUPvu+4
         BuornbiMWAKSAvF/xBmqvPSph3EMPbfqGh4NBGBFkZeljURZvUhBdonnbZb+hAIdpoG7
         FVnGynP4NWOlKN0NSKedeKeNxr728S4sXOZMq7iwq+W67nftRU6Mk6R7yHT8yKesAPhC
         A2GpHj95b1sS0mZSPJSiD1tyM2MDBP14PIkwaghC24hdheWGSCxQA2XLaJxBgGIIbwGu
         vc2g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LC2STsRDtTHQH+0n6h0zR4t4XXF6wi7gwkPfjxXX7qA=;
        b=sincZWCgMHCS0I5LLViyDN17h31Hh/fGw2fID2q8P0yySvqWzrTooLmjKbTYd7jywh
         WHOU/Sb2alg8hX04KGLQnlcCS6lSNmyinEnXnT1bkRW2NMK3sq+fgyGrbJNEyP56qgb4
         PbBJF9WSRSZzKEBFJi73yCth2oh0hnwbTrTfKsCA0Qv8gmKKJ1b1GAzdJX3vLCVhYtwl
         xH6HdM8CM8LLS9Gnccoq/4TQP8quDPnpqEZ/pzW3KzwfXbOYb1LF5FyGdf+clO89wqFi
         ZGEec3kXbsFBAtlhZhBLWlqs066Erws7BC/6r3EbvcdVJhfLnrloYhQMhFw7gj/+SHq/
         SkqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LC2STsRDtTHQH+0n6h0zR4t4XXF6wi7gwkPfjxXX7qA=;
        b=tjNteFAKjNvXzyn9HVM0iTvtHslyY8l0yFaHCKMlplyN+wqHiiueWb1I1pujhkBFrN
         UORo+/pmexcJpQthxzU0ScYibgjBpKTzd/OB7IDWidf7jXpwI0z3iLAt7zfFhKpy1wYz
         hggcuGnbwZ5oapmtYsS1gp8VmxqOoSZzmualbEBppkhJef65NN1VFGixpK0sXsQKkLUn
         V9Ig3cEJ3y+GhJyZd/quxuMj7Kod08PSORX1ZPTkXMGJS4vv924pj9iuDmJ9Wd7k9Ols
         kvArrATvIovgmkX4quVf9xZWYYfxdqBZ6cBC/z/c3zAB8KTMaia/KFUnvFYlYZ5FSyP1
         homQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0Pua6emj0je/m4kgJC2saT9ays8BjO/59UKkDyrA7CAQpLfjRqBWP
	/xQhW5zVjJA6Ezt0mAqd7R4=
X-Google-Smtp-Source: APiQypKySLiO60X2KK2PGBRL6AH61jJB7yYAOtJ8vbVpUoSROsIrLYG9uEnVOIcn5agrHmvs1GK7Rw==
X-Received: by 2002:a17:906:4548:: with SMTP id s8mr15775413ejq.349.1588618135850;
        Mon, 04 May 2020 11:48:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:ee14:: with SMTP id g20ls6134233eds.10.gmail; Mon, 04
 May 2020 11:48:55 -0700 (PDT)
X-Received: by 2002:a50:9b0f:: with SMTP id o15mr16092210edi.325.1588618134978;
        Mon, 04 May 2020 11:48:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588618134; cv=none;
        d=google.com; s=arc-20160816;
        b=aASfFLi1G1MTqGI47ShAZ9foY9MeeD/iKYVfMViu+hLOFKlZlsGpfomY/pkJdX6Rf5
         lQVsAfajUWfpkQaEAKenK7SJ7wGeEBFM+UfA3W17Z5Y3dm9/fBp+WnvEnrxAtolX/Wko
         ntaEgh2umfLWz/Cso+9Zv5fy/wOsJuwcmGssspyCs/EOGOEknXANQ2u8yMvYjOB0930D
         O9ReyqgdUo/VoeDIhH3sIsvGrebwLH4SVqi1uZb82P13gkokygPbvXleskoJPS0dhFVT
         GLOrR9C0qvEetdkNX1469Jr4+0CLg9NR7EbihfoSqGRt21o/1eXgidjW2QpFbXspiIrt
         16xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=uRU+8jHTl7pq5r16Bew4F7zarCikd09TFSeh/Hs3swY=;
        b=gersfMIJIIA6+ZB2SpzJBgKDe5GkPbehs1zC5lKNVIRXn+OwRc9JsROoqtuqD8OXMP
         teac9ZoG6xGrUPET7k9iFWXIaUVAX78mmRSIgapriZcpDKMRONx+ctV6AfzAdJoTZ/gj
         6u96QtIFiI5eop+1dBK0fHowtJhpDejJvb/qJMtGdcBLH0xv7tvhfZwcjtjYtb6sKlZq
         5bRv7QSSR+jATI1mcRh2Sf3/lwmW6VglN5fH5qPvdXMhgCr/E+3ydhmH612L4DeV9LtM
         lRWzuJzaG9xSEL/1DkE3OKpzvRGAxGV0nFKxXlURg9BkzYyPGl29iiK8qCZcSj+B8pKW
         UugQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id l22si905352ejz.0.2020.05.04.11.48.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 May 2020 11:48:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 044ImsDQ002451
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 May 2020 20:48:54 +0200
Received: from [167.87.53.26] ([167.87.53.26])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 044Imq06032330;
	Mon, 4 May 2020 20:48:53 +0200
Subject: Re: [PATCH v2 9/9] Documentation: add description and usage of cache
 coloring support
To: Marco Solieri <ms@xt3.it>, jailhouse-dev@googlegroups.com
Cc: Luca Miccio <lucmiccio@gmail.com>
References: <20190327121849.1882-1-ms@xt3.it>
 <20200421100351.292395-1-ms@xt3.it> <20200421100351.292395-10-ms@xt3.it>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <2b73cdf3-8eb9-fc65-0f22-8725986a4e15@siemens.com>
Date: Mon, 4 May 2020 20:48:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421100351.292395-10-ms@xt3.it>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 21.04.20 12:03, 'Marco Solieri' via Jailhouse wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
>=20
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Marco Solieri <ms@xt3.it>
> ---
>   Documentation/cache-coloring.md | 278 ++++++++++++++++++++++++++++++++
>   1 file changed, 278 insertions(+)
>   create mode 100644 Documentation/cache-coloring.md
>=20
> diff --git a/Documentation/cache-coloring.md b/Documentation/cache-colori=
ng.md
> new file mode 100644
> index 00000000..09aa2e17
> --- /dev/null
> +++ b/Documentation/cache-coloring.md
> @@ -0,0 +1,278 @@
> +Cache Coloring Support
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Introduction
> +------------
> +
> +### Cache partitioning and coloring
> +
> +#### Motivation
> +
> +Cache hierarchies of modern multi-core CPUs typically have first levels
> +dedicated
> +to each core (hence using multiple cache units), while the last level ca=
che
> +(LLC) is shared among all of them. Such configuration implies that memor=
y
> +operations on one core, e.g., running one Jailhouse inmate, are able to =
generate
> +timing *interference* on another core, e.g., hosting another inmate. Mor=
e
> +specifically, data cached by the latter core can be evicted by cache sto=
re
> +operations performed by the former. In practice, this means that the mem=
ory
> +latency experienced by one core depends on the other cores (in-)activity=
.
> +
> +The obvious solution is to provide hardware mechanisms allowing either: =
a
> +fine-grained control with cache lock-down, as offered on the previous v7
> +generation of Arm architectures; or a coarse-grained control with LLC
> +partitioning among different cores, as featured on the "Cache Allocation
> +Technology" of the high-end segment of recent Intel architecture and sup=
ported
> +by the Jailhouse hypervisor.
> +
> +#### Cache coloring
> +
> +Cache coloring is a *software technique* that permits LLC partitioning,
> +therefore eliminating mutual core interference, and thus guaranteeing hi=
gher and
> +more predictable performances for memory accesses. A given memory space =
in
> +central memory is partioned into subsets called colors, so that addresse=
s in
> +different colors are necessarily cached in different LLC lines. On Arm
> +architectures, colors are easily defined by the following circular strid=
ing.
> +

Is this striding architecturally defined? Across ARMv7 and v8? Or could=20
implementation deviate as well? Do you happen to know how AMD or Intel=20
do this, de facto or even in a documented way? At worst, the mapping=20
algorithm would have to be factored out and implemented specifically,=20
but not the logic to exploit this for cache partitioning.

> +```
> +          _ _ _______________ _ _____________________ _ _
> +               |     |     |     |     |     |     |
> +               | c_0 | c_1 |     | c_n | c_0 | c_1 |
> +          _ _ _|_____|_____|_ _ _|_____|_____|_____|_ _ _
> +                  :                       :
> +                  '......         ........'
> +                        . color 0 .
> +                . ........      ............... .
> +                         :      :
> +            . ...........:      :..................... .
> +```
> +
> +Cache coloring suffices to define separate domains that are guaranteed t=
o be
> +*free from interference* with respect to the mutual evictions, but it do=
es not
> +protect from minor interference effects still present on LLC shared
> +subcomponents (almost negligible), nor from the major source of contenti=
on
> +present in central memory.
> +
> +It is also worth remarking that cache coloring also partitions the centr=
al
> +memory availability accordingly to the color allocation--assigning, for
> +instance, half of the LLC size is possible if and only if half of the DR=
AM space
> +is assigned, too.
> +
> +
> +### Cache coloring in Jailhouse
> +
> +The *cache coloring support in Jailhouse* allows partitioning the cache =
by
> +simply partitioning the colors available on the specific platform, whose=
 number
> +may vary depending on the specific cache implementation. More detail abo=
ut color
> +availability and selection is provided in [Usage](#usage).
> +
> +#### Supported architectures
> +
> +Cache coloring is available on Arm64 architectures. In particular, exten=
sive
> +testing has been performed on v8 CPUs, namely on the A53 and A57 process=
ors
> +equipping Xilinx ZCU102 and ZCU104.
> +
> +#### Limitations
> +
> +Since Jailhouse is currently lacking SMMU support, and since the colored=
 memory

No longer true. We already have SMMUv3, and I will review the pending v2=20
patches soon.

> +mapping must be provided to DMA devices to allow them a coherent memory =
view,
> +coloring for this kind of devices is not available.
> +This also explain why also coloring support for the Linux root cell is n=
ot
> +provided, although possible and tested with a simple hot remapping proce=
dure.

I think this should be reworded so that it is made clear that dynamic=20
reconfiguration of DMA mappings (or actually their activation) is not=20
supported, and therefore also root cell coloring.

> +
> +### Further readings
> +
> +Relevance, applicability, and evaluation results of the Jailhouse cache =
coloring
> +support are reported in several recent works. A non-technical perspectiv=
e is
> +given in [1] together with an overview of the ambitious HERCULES researc=
h
> +project. A technical and scientific presentation is instead authored in =
[2],
> +where additional experimental techniques on cache and DRAM are introduce=
d. A
> +specific real-time application is extensively discussed in [3].
> +
> +An enjoyable, comprehensive and up-to-date survey on cache management te=
chnique
> +for
> +real-time systems is offered by [4].
> +
> +1. P. Gai, C. Scordino, M. Bertogna, M. Solieri, T. Kloda, L. Miccio. 20=
19.
> +   "Handling Mixed Criticality on Modern Multi-core Systems: the HERCULE=
S
> +   Project", Embedded World Exhibition and Conference 2019.
> +
> +2. T. Kloda, M. Solieri, R. Mancuso, N. Capodieci, P. Valente, M. Bertog=
na.
> +   2019.
> +   "Deterministic Memory Hierarchy and Virtualization for Modern Multi-C=
ore
> +   Embedded Systems", 25th IEEE Real-Time and Embedded Technology and
> +   Applications Symposium (RTAS'19). To appear.
> +
> +3. I. Sa=C3=83=C2=B1udo, P. Cortimiglia, L. Miccio, M. Solieri, P. Burgi=
o, C. di Biagio, F.
> +   Felici, G. Nuzzo, M. Bertogna. 2020. "The Key Role of Memory in
> +   Next-Generation Embedded Systems for Military Applications", in: Cian=
carini
> +   P., Mazzara M., Messina A., Sillitti A., Succi G. (eds) Proceedings o=
f 6th
> +   International Conference in Software Engineering for Defence Applicat=
ions.
> +   SEDA 2018. Advances in Intelligent Systems and Computing, vol 925. Sp=
ringer,
> +   Cham.
> +
> +4. G. Gracioli, A. Alhammad, R. Mancuso, A.A. Fr=C3=83=C2=B6hlich, and R=
. Pellizzoni. 2015.
> +   "A Survey on Cache Management Mechanisms for Real-Time Embedded Syste=
ms", ACM
> +   Comput. Surv. 48, 2, Article 32 (Nov. 2015), 36 pages. DOI:10.1145/28=
30555
> +
> +
> +
> +
> +Usage
> +-----
> +
> +### Enable coloring support in Jailhouse
> +
> +In order to compile Jailhouse with coloring support add `CONFIG_COLORING=
` to the
> +hypervisor configuration file (include/jailhouse/config.h)
> +```
> +#define CONFIG_COLORING 1
> +```

Should be overcome.

> +
> +### Colors selection using indices
> +
> +We shall first explain how to properly choose a color assignment for a g=
iven
> +software system.
> +Secondly, we are going to deep into the root cell configuration, which e=
nables
> +cache coloring support for inmates.
> +Lastly, we are explaining how a color selection can be assigned to a giv=
en cell
> +configuration.
> +
> +In order to choose a color assignment for a set of inmates, the first th=
ing we
> +need to know is... the available color set. The number of available colo=
rs can
> +be either calculated[^1] or read from the handy output given by Jailhous=
e once
> +we enable the hypervisor.
> +
> +```
> +...
> +Max number of avail. colors: 16
> +Page pool usage after early setup: mem 39/992, remap 0/131072
> +...
> +```
> +
> +[^1]: To compute the number of available colors on the platform one can =
simply
> +  divide
> +  `way_size` by `page_size`, where: `page_size` is the size of the page =
used
> +  on the system (usually 4 KiB); `way_size` is size of a LLC way, i.e. t=
he same
> +  value that has to be provided in the root cell configuration.
> +  E.g., 16 colors on a platform with LLC ways sizing 64 KiB and 4 KiB pa=
ges.
> +
> +Once the number of available colors (N) is known, we select a range of c=
olors
> +between 0 and N-1 and we will use the `jailhouse_cache` structure to to =
inform
> +the hypervisor of our choice, as later explained in the section about
> +[cells configuration](#cells-configuration).
> +
> +Ex:
> +```
> +Max. available colors 16 [0-15]
> +Range_0: [0-5]
> +Range_1: [8-15]
> +```
> +
> +#### Partitioning
> +
> +We can choose any kind of color configuration we want but in order to ha=
ve
> +mutual cache protection between cells, different colors must be assigned=
 to them.
> +Another point to remember is to keep colors as contiguous as possible, s=
o to
> +allow caches to exploit the higher performance to central memory control=
ler.
> +So using different but single ranges for each cells is the most simple w=
ay to
> +have mutual cache protection.\
> +Ex: cell-1 has range `[0-7]` and cell-2 has range `[8-15]`.
> +
> +### Root Cell configuration
> +
> +#### Load start address
> +
> +Coloring support uses a special memory region to load binaries when cell=
s are
> +configured to use cache coloring. This mapping has the same size and col=
oring
> +selection as the cell but it starts from a virtual address that is defin=
ed by
> +the variable `col_load_address`. This value is set to 16 GiB by default =
but it
> +can be configured by the user depending on the platform. The value shoul=
d be
> +set to a memory space that is not used in the platform e.g., devices.
> +
> +For example, if we want to change this address to 32 GiB:
> +```
> +...
> +.platform_info =3D {
> +    ...
> +    .col_load_address =3D 0x800000000,
> +    .arm =3D {
> +        .gic_version =3D 2,
> +        .gicd_base =3D 0xf9010000,
> +        .gicc_base =3D 0xf902f000,
> +        .gich_base =3D 0xf9040000,
> +...
> +```
> +
> +#### LLC way size
> +
> +This field is _mandatory_ for using coloring support. It can be explicit=
ly
> +defined by the user in the Root Cell configuration or it can be leaved e=
mpty and
> +the hypervisor will try to probe the value.
> +The value corresponds to the way size in bytes of the Last Level Cache a=
nd
> +could be calulated by dividing the LLC size by the number of way
> +(the way number refers to N-way set-associativity).
> +
> +For example, a 16-way set associative cache sizing 1 MiB has a way size =
of
> +64 KiB:
> +```
> +...
> +.platform_info =3D {
> +    ...
> +    .llc_way_size =3D 0x10000,
> +    .arm =3D {
> +        .gic_version =3D 2,
> +        .gicd_base =3D 0xf9010000,
> +        .gicc_base =3D 0xf902f000,
> +        .gich_base =3D 0xf9040000,
> +...
> +```
> +
> +### Cells configuration
> +
> +First of all we need to select one or more range(s) for coloring
> +configuration that will be applied to **all** memory regions flagged wit=
h
> +`JAILHOUSE_MEM_COLORED`. Each range is defined using the `struct jailhou=
se_cache`
> +where the `.start` and `.size` values correspond respectively the start =
and size
> +of the range itself.
> +```
> +...
> +struct jailhouse_memory mem_regions[12];
> +struct jailhouse_cache cache_regions[1];
> +...
> +.num_memory_regions =3D ARRAY_SIZE(config.mem_regions)
> +.num_cache_regions =3D ARRAY_SIZE(config.cache_regions),
> +...
> +.mem_regions =3D {
> +        ...
> +        /* Colored RAM */ {
> +                .phys_start =3D 0x810000000,
> +                .virt_start =3D 0x0,
> +                .size =3D 0x10000,
> +                .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +                        JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
> +                        JAILHOUSE_MEM_LOADABLE| JAILHOUSE_MEM_COLORED,
> +        },
> +        ...
> +}
> +...
> +.cache_regions =3D {
> +        {
> +                .start =3D 0,
> +                .size =3D 8,
> +        },
> +},
> +...
> +```
> +In the example we have a platform with 16 colors available and we are se=
lecting
> +the range [0-7] that goes from 0 to 7 (8 colors).
> +
> +#### Overlaps and colored memory sizes
> +
> +When using colored memory regions the rule `phys_end =3D phys_start + si=
ze` is no
> +longer true. So the configuration must be written carefully in order to =
avoid to
> +exceed the available memory in the root cell. The hypervisor performs a =
check
> +when a colored region is created but it's up to the configurator to fix =
the
> +issue.
> +Moreover, since the above rule does not apply, it is very common to have=
 overlaps
> +between colored memory regions of different cells if they are sharing co=
lors.
>=20

As pointed out before, this leaves it unclear to me how coloring affects=20
the effective size of a memory region, or its physical address range.=20
That must be clarified.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/2b73cdf3-8eb9-fc65-0f22-8725986a4e15%40siemens.com.
