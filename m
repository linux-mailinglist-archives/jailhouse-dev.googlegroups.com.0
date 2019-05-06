Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBRHHX7TAKGQEAQKYWZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFD4146A1
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 May 2019 10:43:49 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id o82sf1986685wmb.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 May 2019 01:43:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557132228; cv=pass;
        d=google.com; s=arc-20160816;
        b=yX0Hjve15lAJR+khYgIkMelUzYMUvFaQS6tJtXxccFKEcUMX04knN5VI1CwQ9PwZIR
         kvdn1gGQBB5JDPg1EhmxiKXHIQUpUz48YRwIqIY8Yk7DngV1LnyrOzh1Y5qa2Ipeqi5e
         cAEhQg+C9loACDQJ4K0BkaHcKpvUbnVTsclAKPTXAurAJMhtr1eJ6tLtPTKC8CHvUCTR
         RG+FdyN+wrCBzOuYT1LxJLFlUubocdP5M49A7bdtJMaGaebr/Ykn0u9mpbqxgGN5TRAD
         QioWRQtJY0ZxlDnWN7xNPpsc4RAGqcraYM+TDKfBLLCH+gAsryoFbE46ZC7yjuzwJ2UQ
         bGoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:sender:dkim-signature;
        bh=y98IxT9xjSj5+0Af1ghEh0WjdMpyLNlJ+LdAj6mlVJw=;
        b=ZiF1p3RLKs2ZnRkuRhQDNsrAqaFk2ckLMdrlFqCPyvsyRMel4UbGedWvsJwItzLu+b
         NMTo1iH0Sn6ShTlJfv4JnJi/oPoDb1//o8Jua/hkWFKuaNowFKhhwiTgV17dYOOOoAzG
         5nKqm+nFlMQtYjjl3xqYFXVJPB/Ahj7AUXjcUO+1QflsIbihFPKrNofxPZPquNxUporS
         LC9s4jxPfWuk333N6ATOCiqCjCa3S2jqFpXc5Dtgg1dW5AqX9cJQhr/6Adi7EhZTqGmR
         UPFYs4M5V8MjB/8if4bU5yXn7wjwx4CaN6jdsR9TAG2MPL/DSPCptOC0HceSFW0zjJ8Q
         R2Ww==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=henning.schild@siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=y98IxT9xjSj5+0Af1ghEh0WjdMpyLNlJ+LdAj6mlVJw=;
        b=Agj2IJ+JcDlaWN1NR7CTztrk8cyjW57lThsCvriNhjV2pXhwF+u7tevegEhbaIFvvG
         akltR06soKPwZCpsCZugdUVhXHH+EbQGIwFvjua3Cq93ILBW7Ev4ahPeYIWagKDV1b4O
         wlWGZoJRAcp+Iou7/j2UlxDDybdrNId2hhK4Y5L7OwxpF1iS/7TS5GbTdaX3ndlUqBHG
         7ihFRCLpKbFjIoU8s8moma3N87Wb9BDxh8Q+R6L86lR/4zmJtBuPv/UkAcpoHK5PrVeq
         csxSBY9HZk3b5Im7KKjZ6NYrzOnCynUe3CMTw0pRlIuS9yEarEeF35+VAseHeFD2Z3hq
         xjqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=y98IxT9xjSj5+0Af1ghEh0WjdMpyLNlJ+LdAj6mlVJw=;
        b=uiSEb23jkDKw1QmtTRrH1Y1iQ5kcfkynmQHEAibGh2E3VrWJ3fFxLhxLuNXBP0bTkR
         AtdtTjhHSGxnpAPF77W/GFj2u5FgJa6LzQikCjA0G9qwsXlCqb9Y3CrNytiV82gvCK1p
         ZKmHQAJyAYr9xXwI7mpjC26mBWRV1F5MoU8/UqTxbMRMUW40BRave01HOx/+cSPaDpcc
         DTrDS15czODcRUEa2vFKVYVJFXSLlXQNbski1rOAjD1ZCOkXVxk8i5cfBb9XeiWsQ0bt
         jPlHH275HkMx1bXJwrq3ZBsNaZEiXGZMmTyjztjQlhF/1ryinzpfrK9m/u5uzrAwlJ5U
         zxFg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWGC7YE6eS1/WkYWAYLQGEHsO2g6X3NhgicZh7gY4cWp5Kwr4EX
	yM2XWkmLBbXr6mNgeYE0jKs=
X-Google-Smtp-Source: APXvYqxyR4t1h6Wy0DWttlOC5/J90ZBuouiHaYSqNlCPIDhVHQYT4TH+/bzJChlsbaK5FiM81kG+mA==
X-Received: by 2002:a5d:488d:: with SMTP id g13mr17154801wrq.119.1557132228789;
        Mon, 06 May 2019 01:43:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ffc1:: with SMTP id x1ls2890168wrs.5.gmail; Mon, 06 May
 2019 01:43:48 -0700 (PDT)
X-Received: by 2002:a5d:4ec9:: with SMTP id s9mr16876927wrv.223.1557132228046;
        Mon, 06 May 2019 01:43:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557132228; cv=none;
        d=google.com; s=arc-20160816;
        b=I+P1sD/sQx0sXqC1R8ZghLyYPx/zyUxE6pQHP9LXbS24yUz8oSBuWO2v0HAET18q48
         hk3sfRZzf18GRuGhTtsQpeWpciOjAWMYqh6eKH7uI+ustauARg/Vvp6nrMdw4GHHmlVC
         lnZ9Zj0EaLahbujswE520sfrkBQUz4bGsKs1PdSGM9UH3jPIg8rg5DLiEASEPl5eQza2
         95Z0Y/f/6NFR2Y4vRVSH0lPO/Ty1UGiQHdxz1XPFW9KHCu4Dlvio8HzIdvLgE+Ig8AJ4
         +/VCYPlhp0Njw53qG/TyW/y9GTXhMZ24v+QqZDqahcbq5Ad48fzzmqr+Jb0Sn8cGZNrc
         AGDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=nwrG27mKNocpbh/nXqGllzIL5v9OU+PnEWAnsciXwSI=;
        b=XUFr+aB0tkBrrc3DwB4N7JOmwkGJ5pZdt+FC6LU4JIKg+Lc2+cHm0nmsmnChEZB3N+
         Rps+ev0h13O5uOlgOCVZGZXK1VszBjzqEFvhMwbCTi8Qs0J/tRLppplSCDHOYPpmjYGv
         Huooo/YTJm2TtDgRQBAoiVOxGBDlsBciwSwyUG4xN3cMqyx6F01CC/Ee4p0kx0axV21e
         EV0CJzmd3eBnvu0S+xvjFTEQx0gM6yD9s+uEkjprUKmUbG+5jBK6sAZE6PpefCy94SAv
         4Xl59IVThL+/nawC0pY+eITIrucoU3Q0u6J0teRu06kwGiEf/dX5gzrgnebjCuKfQcmR
         OzfQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=henning.schild@siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id x4si481242wmh.2.2019.05.06.01.43.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 01:43:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x468hlTK030082
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 May 2019 10:43:47 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.68.211])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x468hk9L010816;
	Mon, 6 May 2019 10:43:46 +0200
Date: Mon, 6 May 2019 10:43:44 +0200
From: Henning Schild <henning.schild@siemens.com>
To: =?UTF-8?B?SGFra8Sx?= Kurumahmut <hkurumahmut84@hotmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: [PATCH] Scripts: Fix for Parsing DMAR Region under Reserved
 Section
Message-ID: <20190506104344.33303fdc@md1za8fc.ad001.siemens.net>
In-Reply-To: <62e83024-118e-4109-ab5e-330bec67389f@googlegroups.com>
References: <62e83024-118e-4109-ab5e-330bec67389f@googlegroups.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com
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

Hi Hakki,

you found the right spot to exclude something from the generally
blacklisted "reserved" but i still have a few comments, find them
inline.

Am Sun, 5 May 2019 12:35:49 -0700
schrieb Hakk=C4=B1 Kurumahmut <hkurumahmut84@hotmail.com>:

> While kernel command parameters are intel_iommu=3Don intremap=3Don at
> some machines, cat /proc/iomem shows DMAR region under reserved
> section. This patch must be done for config creation to complete
> because of generating DMAR region not found error although it exist.
> If this patch is not apply, below error is throw by "cell create"
> command whether intel_iommu On or Off because "reserved" regions are
> currently excluded from the generated config although DMAR region
> exists. Thus, DMAR under reserved section must be parsed by parser.
>=20
>=20
>             if size =3D=3D 0:=20
>                 raise RuntimeError('DMAR region size cannot be
> identified.\n' 'Target Linux must run with Intel IOMMU '=20
>                                    'enabled.')
>=20
>=20
> git diff=20
> diff --git a/pyjailhouse/sysfs_parser.py
> b/pyjailhouse/sysfs_parser.py index 46c95fc2..70fe8869 100644=20
> --- a/pyjailhouse/sysfs_parser.py=20
> +++ b/pyjailhouse/sysfs_parser.py=20
> @@ -94,14 +94,13 @@ def input_listdir(dir, wildcards):=20
>  =20
>  =20
>  def parse_iomem(pcidevices):=20
> -    regions =3D IOMemRegionTree.parse_iomem_tree(=20
> -        IOMemRegionTree.parse_iomem_file())=20
> +    dmar_regions =3D []=20
> +    regions =3D
> IOMemRegionTree.parse_iomem_tree(IOMemRegionTree.parse_iomem_file(),
> dmar_regions) rom_region =3D MemRegion(0xc0000, 0xdffff, 'ROMs')=20
>      add_rom_region =3D False=20

This is confusing. I guess parse_iomem_tree should return (regions,
dmar_regions). Here you mix returning by value and by ref.

>      ret =3D []=20
> -    dmar_regions =3D []=20
>      for r in regions:=20
>          append_r =3D True=20
>          # filter the list for MSI-X pages=20
> @@ -878,9 +877,27 @@ class IOMemRegionTree:=20
>  =20
>          return regions=20
>  =20
> +    # find DMAR regions in tree=20
> +    @staticmethod=20
> +    def find_dmar_regions(tree):=20
> +        regions =3D []=20
> +=20
> +        for tree in tree.children:=20
> +            r =3D tree.region=20
> +            s =3D r.typestr=20
> +=20
> +            if (s.find('dmar') >=3D 0):=20
> +                regions.append(r)=20
> +=20
> +            # if the tree continues recurse further down ...=20
> +            if (len(tree.children) > 0):=20
> +
> regions.extend(IOMemRegionTree.find_dmar_regions(tree))=20
> +=20
> +        return regions=20

This is just a copy of find_hpet_regions. I would suggest to change the
original to i.e. "find_regions_by_name(tree, name)"

And now call that once with name=3D"HPET" and once with name=3D"dmar".


>      # recurse down the tree=20
>      @staticmethod=20
> -    def parse_iomem_tree(tree):=20
> +    def parse_iomem_tree(tree, dmar_regions):
>=20
>          regions =3D []=20
>  =20
>          for tree in tree.children:=20
> @@ -904,11 +921,12 @@ class IOMemRegionTree:
>=20
>              # generally blacklisted, unless we find an HPET behind

This is now incorrect. Change to i.e. "# generally blacklisted, with a
few exceptions"

Henning

> it if (s.lower() =3D=3D 'reserved'):=20
>                  regions.extend(IOMemRegionTree.find_hpet_regions(tree))=
=20
> +
> dmar_regions.extend(IOMemRegionTree.find_dmar_regions(tree)) continue
>
>  =20
>              # if the tree continues recurse further down ...=20
>              if (len(tree.children) > 0):=20
> -
> regions.extend(IOMemRegionTree.parse_iomem_tree(tree))=20
> +
> regions.extend(IOMemRegionTree.parse_iomem_tree(tree, dmar_regions))
> continue=20
>              # add all remaining leaves
>=20
>=20
> Example /proc/iomem
>=20
> "intel_iommu=3Don intremap=3Don"
>=20
> You can see that dmar0 under Reserved region.
>=20
> ubuntu@ubuntu-HP8300:~$ sudo cat /proc/iomem=20
> 00000000-00000fff : Reserved=20
> 00001000-0009ffff : System RAM=20
> 000a0000-000bffff : PCI Bus 0000:00=20
> 000c0000-000ce9ff : Video ROM=20
> 000cf000-000cffff : Adapter ROM=20
> 000d0000-000d3fff : PCI Bus 0000:00=20
> 000d4000-000d7fff : PCI Bus 0000:00=20
> 000d8000-000dbfff : PCI Bus 0000:00=20
> 000dc000-000dffff : PCI Bus 0000:00=20
> 000f0000-000fffff : System ROM=20
> 00100000-38ffffff : System RAM=20
> 39000000-78ffffff : Reserved=20
> 79000000-de35bfff : System RAM=20
> de35c000-de365fff : Unknown E820 type=20
> de366000-de3e6fff : Reserved=20
> de3e7000-de414fff : Unknown E820 type=20
> de415000-de93efff : Reserved=20
> de93f000-deba4fff : ACPI Non-volatile Storage=20
> deba5000-debb5fff : ACPI Tables=20
> debb6000-debbefff : ACPI Non-volatile Storage=20
> debbf000-debc3fff : ACPI Tables=20
> debc4000-dec06fff : ACPI Non-volatile Storage=20
> dec07000-deffffff : System RAM=20
> df000000-dfffffff : RAM buffer=20
> e0000000-feafffff : PCI Bus 0000:00=20
>   e0000000-efffffff : PCI Bus 0000:01=20
>     e0000000-efffffff : 0000:01:00.0=20
>   f0000000-f0000fff : pnp 00:0a=20
>   f7e00000-f7efffff : PCI Bus 0000:01=20
>     f7e20000-f7e3ffff : 0000:01:00.0=20
>   f7f00000-f7f1ffff : 0000:00:19.0=20
>     f7f00000-f7f1ffff : e1000e=20
>   f7f20000-f7f2ffff : 0000:00:14.0=20
>     f7f20000-f7f2ffff : xhci-hcd=20
>   f7f30000-f7f33fff : 0000:00:1b.0=20
>     f7f30000-f7f33fff : ICH HD audio=20
>   f7f35000-f7f350ff : 0000:00:1f.3=20
>   f7f36000-f7f367ff : 0000:00:1f.2=20
>     f7f36000-f7f367ff : ahci=20
>   f7f37000-f7f373ff : 0000:00:1d.0=20
>     f7f37000-f7f373ff : ehci_hcd=20
>   f7f38000-f7f383ff : 0000:00:1a.0=20
>     f7f38000-f7f383ff : ehci_hcd=20
>   f7f39000-f7f39fff : 0000:00:19.0=20
>     f7f39000-f7f39fff : e1000e=20
>   f7f3a000-f7f3afff : 0000:00:16.3=20
>   f7f3c000-f7f3c00f : 0000:00:16.0=20
>     f7f3c000-f7f3c00f : mei_me=20
>   f8000000-fbffffff : PCI MMCONFIG 0000 [bus 00-3f]=20
>     f8000000-fbffffff : Reserved=20
>       f8000000-fbffffff : pnp 00:0a=20
> fec00000-fec00fff : Reserved=20
>   fec00000-fec003ff : IOAPIC 0=20
> fed00000-fed03fff : Reserved=20
>   fed00000-fed003ff : HPET 0=20
>     fed00000-fed003ff : PNP0103:00=20
> fed10000-fed17fff : pnp 00:0a=20
> fed18000-fed18fff : pnp 00:0a=20
> fed19000-fed19fff : pnp 00:0a=20
> fed1c000-fed44fff : Reserved=20
>   fed1c000-fed1ffff : pnp 00:0a=20
>     fed1f410-fed1f414 : iTCO_wdt.0.auto=20
>   fed20000-fed3ffff : pnp 00:0a=20
>   fed40000-fed44fff : pnp 00:00=20
>     fed40000-fed44fff : TPM=20
> fed45000-fed8ffff : pnp 00:0a=20
> fed90000-fed93fff : Reserved=20
>   fed90000-fed90fff : dmar0                *****DMAR is under
> reserved region, current parser ignores****** fee00000-fee00fff :
> Local APIC fee00000-fee00fff : Reserved=20
> ff000000-ffffffff : Reserved=20
>   ff000000-ffffffff : INT0800:00=20
>     ff000000-ffffffff : pnp 00:0a=20
> 100000000-21dffffff : System RAM=20
>   1fe800000-1ff4031d0 : Kernel code=20
>   1ff4031d1-1ffe928ff : Kernel data=20
>   200119000-200361fff : Kernel bss=20
> 21e000000-21fffffff : RAM buffer=20
> ubuntu@ubuntu-HP8300:~$
>=20
>=20
> HAKKI
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
