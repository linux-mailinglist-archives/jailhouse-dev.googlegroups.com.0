Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBMMT37TAKGQEGRX7EVQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BAB1AAFB
	for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 09:22:25 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id b29sf775894lfo.17
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 00:22:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557645745; cv=pass;
        d=google.com; s=arc-20160816;
        b=XIgoGxzm6DqptJuNmDp6BakXMta5NDB5ifeMCM82hqRgUOjrOcJg0olTt2rabXehja
         js7e1T/+zW2BQBYcwuYCChjQGfIPzQ5PP6m1lDuTQccaVL8+EuL2JhU5IXVZuzczF42G
         mhf9J5/FC3NrFHUUeaCH59H7OMIwJar80avYEdqWN9ZPcUBJw4k7XB69TDKnZreMnOgO
         PveFKCZ/uKqh56EtvnZHd0ufbFx4EUW8q3jhA2rBCwpawpmi0kDi/h5zeU4tYQHt+S64
         Kdn+ELuhpQhnVHF1T8QxNjTg2J+5N0Yg4YKpT0QuKBwF4yEyIM3a95uhyFyOTyHPUZo1
         VQ8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=GJ8ezGhGxmJplSbZHq9+wDuO71IYodvaepGHX4Fn86o=;
        b=nzDsyJN0wGiaTUviKYHUGCiRZ3oxA0uPrR8iZu9RAi+hdDnkAy2etcsWyTa6D90lUC
         O4ISEOiFc9Ilg4idSwT6tytaeqX6eOl1wqBLEIw62hwK9fhWPht4pblxCdASwZRJsOPk
         KH/t+JnSZ2lMw3qWGw5BtBiGEL6M2e88ncZGGAKv+MF+ekp/oOgqIx3NmHIx4ChkgEhz
         0/DYW78KJX96EgdOOkR0EbXf5BbRz9eyoXrR7CA1xHDoDuWVtUWIHIJsm+gdbt9qx3nq
         wZLk6Vma3B+xCoIWHyLye3slULBwXZD+Bh/o3KhVbx2GW0JGSDWDmZ4+zdwfUdoFwETH
         rnrg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=PW7in+tV;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GJ8ezGhGxmJplSbZHq9+wDuO71IYodvaepGHX4Fn86o=;
        b=Mt1o8IDVQnldFEOahMYDDxmJBOCYKCs14tRNrGShqj8mhC3d+S9d3D20wYBmJ1FRd3
         4CCFN/+9BXMEc3xjh1bKlZR0TQtonrIrC/cM5TJc9GNusBou8a0Mr4GbyynRK7HQIQoo
         NUja10DQbN2uFwkOawNZ5pVw1CQpG2SxsVLkPmB3rAoyJy0W3b6TSC2He4/j6iJoHZvW
         2MsSpTqFD2f3AcyGKNdZyZSWv6Ynj2CQCLBBVJLETC8ifnymkcmmIXVJ4chFK9w2Eehp
         q7iJtTHIIHXAsvw9ueQAXEza1ks7EwiOkI+zXzEEtT2ZJ0oYM52M1i860fVpsy1dblWf
         GW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GJ8ezGhGxmJplSbZHq9+wDuO71IYodvaepGHX4Fn86o=;
        b=rg+MokInLa33dmJ1qPKxI/cvzNaxbf8NBau8Yd/RibbRcDN2xZx1ZklTnEdyRg9JEz
         cHRvTtA1yNGKuJw3YVxQKzvj6stCWiE+gf5vIKg5bepfhjSGv+tV4pe2c/7ZZbcyPvdL
         ApsJzs/iJRbbZh/UTDTnQ5xxJ51yu5oV6kBmByXcW2I0vDxpSgIPebKKQcyno76IYoED
         S4hao7ZhPeUtSJ8BhBBPKwhJ8fvvmVNkQfuuZrr+74XVOvGa2bGxK1lJy/XkJm52cjhj
         5VBOtX7DBa5n2WVz+uAgEKdLEL8y5pydc725N97ibIkVcr2VC2VlxJb5gtQ9Bs8LUrBc
         8Rzg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXFmcw3ZAY1GhfrKH0DpvO4OK0xnvz4hj/OFCr188AkMIp1t4Cx
	yEPyemBAQe5VeKh9ah03dqg=
X-Google-Smtp-Source: APXvYqxHs/uFd+2xM9FCk8Snxhba3oZJLW47wXaeNWYq4X5IOXTbQWUunynHpcXp4YP+nm6YwVZJKw==
X-Received: by 2002:ac2:44b3:: with SMTP id c19mr10963642lfm.132.1557645745120;
        Sun, 12 May 2019 00:22:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:48a7:: with SMTP id u7ls870859lfg.5.gmail; Sun, 12 May
 2019 00:22:24 -0700 (PDT)
X-Received: by 2002:a19:81d4:: with SMTP id c203mr10382506lfd.160.1557645744582;
        Sun, 12 May 2019 00:22:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557645744; cv=none;
        d=google.com; s=arc-20160816;
        b=XcIXTkjxwk7i9LPIkdQSC4uE59l/477BdrEesD6D80xkYgY9aPO0zq67T88Ne+q21P
         1u2SQPcRerGQ9GpmbjtIT6MnPkut8aP13r5m83jMmPRwSKoM9NeNK+8pV5+5r2tZdfPn
         QLgBHF0zM2+zQWgN5vc6i9jgm7S8tNkHlD014IeSYASy3+G2m0ugfjQ5/Tz9Xw4gMAX3
         VB9+v3rHiZ9IzTNBeZQvCqvGWEFj9+Q7BQDgNCrKeYAbwGluXEq60fuipC2VUyzkvKcm
         9atIh3Mwon084YoednQBCrqPWg07Od+XmRWix+hIlZyBzhnVeFhwCbGaX2hptQuBccM6
         owrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=HKES14/OW4I6FmvYi4+91qP8FPK/yUJktTatzd5/DkU=;
        b=tgkMLjsbFoPHEXnsb4ypDrWyY6NEvqN6iTrAt9yvMxjviPXNKS4EQxb0v3XPOh5luv
         6f/WPMi+ORgh1fmrK8lH8pIBrIALfmVXyqvaLKfIZ7CUGaeRuLQNu7gxAO/kZ7JODmJW
         fPZIy7AptcDnMWvoILVjA+NsomHAPKHOE91/IVjym8qv6+P8ewnNMn7/vz7xaQiutGAI
         8hRjaOgHqtLBni2OHeKuBHSdmyu0fKbE1e12RZxGulbnX61EDdiIlbUkXAqkMEx8GsOP
         RUADJ+DXJTVZ1OHBfcAHX3/FbkSjzZpH6BHxkRK2YGDy6/GkUL+Ox42QANQDsM7Ckfmg
         k/CA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=PW7in+tV;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id j7si2157126ljc.0.2019.05.12.00.22.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 00:22:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lu4qk-1gfuPZ3O2Y-011Uga; Sun, 12
 May 2019 09:22:23 +0200
Subject: Re: [PATCH] Scripts: Fix for Parsing DMAR Region under Reserved
 Section
To: =?UTF-8?Q?Hakk=c4=b1_Kurumahmut?= <hkurumahmut84@hotmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <62e83024-118e-4109-ab5e-330bec67389f@googlegroups.com>
 <de3120a5-36a0-a681-1642-5fbabaf6b524@siemens.com>
 <6696c5ac-a0d9-4574-9eff-dd07eb08280c@googlegroups.com>
 <1dc27db0-aaf6-3107-bfea-70e2b4b75551@siemens.com>
 <7a773b9f-976c-468f-a635-daefff7b9666@googlegroups.com>
 <d88d8ae0-3f95-4cbb-812c-46e9d3bf1575@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <99d010c0-a646-2109-e575-51daf26d53b9@web.de>
Date: Sun, 12 May 2019 09:22:23 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <d88d8ae0-3f95-4cbb-812c-46e9d3bf1575@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Pq5pOIm4pfJ+lWaYUZZVgN0mTSiJMwcsfUAfJortktg9yQyJBUW
 MhhwsDgClxS7Oqj+cZxtsouc/Pr7HWEiT0CW3LwM01s9NkAl1k4TpDSQtBfnW4GCD1IpTUz
 AxiXIegTOyaSfr/xLl6Zy6dHUt/a8Q/QHg7GZOrQ9oVGH1eMNbST86sQk45Gd3G3FTgFhlm
 4mqEJQQQsAlpi/1mYcHHA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nKhArc9+6p0=:MTvfuZ62scReQIBjax5SxR
 nuDYfJnB2hu89QwSo23Utx8TxfJ9n1gZwUz3eHTkPQ6dsrKpPFkk1kUqra3qz6bJccVrSzkzO
 8uHchi7I4g2VAte0ynAjT80YWyI79XE1Rwin81gd+ZgWsBqFU8MPfTdDttiNff2zDR8ux4dhi
 2vJLUyULyNCNooigd8AMxNaPj5kPDGpYiH5LND2EbbCa98hcOtjX1VUVRwXsXMYaqbgbvML6M
 VHcuvSd3ZFOsl2J6KI6MaUsP5/Z6ysyQQhBvT/vrQAfcCkFe9N9CnK1D0v51jMQMvQjSWAMau
 rw2ms0/Bh/H6oWEw8rDDNmowLscrRuA+bhpDE8t/W1q/nH3lIAx9xuf14UPBKG+Vnnf5RHQjb
 j6UyH75qsVooLXO6FYV6aihMcb59BxLLgXZaT3+g7L+L/JPZmG9xtemsnOn2p3fjSCbkpvV0U
 RKnpda86xyz0vg2cQ+RNv6zjSQe5Vx3NmzhYdyEJwnni6P7BzBk9691zuBAq8K7aQ5qnmyGuI
 oy0QutgzzZtuWISerw03apv7ZI2CeZ9bYqzLToQrFVlmzwQugYuX5PYVjlg0We5R6tBFQi4jk
 LQ+lCWPF8tzc1my1FAzV4eJqVu+J6HIiCW+yL2OClowpDpj4PPnKqao521D4hIMplMbd+NaIi
 LkXMQRCrrRTrLCJgNwjX7LvSmSfUpQG0B2pVOAWcLK4eRdTwAT/tcmeBjIlPzZNTtoCJ/XvAN
 v6Ve2FYxA7wX/16WrbD6hZiBnmTFMKcLCjzbPN5k5L0lZ5K6qDEVtsBlkGfxaZraEVZoneoI4
 O2yoBbXsOXhEdKSd1XQNvtkkcCASYNtbAxH7+/gjzQioxEdmtLq+aIkND7KcAvewJiTArG0fx
 Em/lReGDfH+W22OfkSsoj0n5J0jF/W8Wu3ZztOIeAQTIxhOtMcIjsb5+imgb1GWVcM4S/Xe/l
 GTPgx32YtMQ==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=PW7in+tV;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 07.05.19 18:44, Hakk=C4=B1 Kurumahmut wrote:
> FINAL PATCH:
>
> It is committed for jailhouse/next branch.
>
>
>  From aa9e7f0e25317d2f516da68b4163f9f08fc6c76d Mon Sep 17 00:00:00 2001
> From: HAKKI KURUMAHMUT <kurumahmut@gmail.com>
> Date: Tue, 7 May 2019 19:37:59 +0300
> Subject: [PATCHv2] Scripts: Fix for Parsing DMAR Region under Reserved Se=
ction
>
>   While kernel command parameters are intel_iommu=3Don  intremap=3Don at
>   some machines, cat /proc/iomem shows DMAR region under reserved section=
.
>   This patch must be done for config creation to complete because of
>   generating DMAR region not found error although it exist. If this patch=
 is
>   not apply, an error is throw by "config create" command whether
>   intel_iommu On or Off because "reserved" regions are currently excluded=
 from
>   the generated config although DMAR region exists. Thus, DMAR under rese=
rved
>   section must be parsed by parser.
>
> Signed-off-by: HAKKI KURUMAHMUT <kurumahmut@gmail.com>
> ---
>   pyjailhouse/sysfs_parser.py | 23 +++++++++++++----------
>   1 file changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> index 46c95fc2..4f5da12e 100644
> --- a/pyjailhouse/sysfs_parser.py
> +++ b/pyjailhouse/sysfs_parser.py
> @@ -94,14 +94,13 @@ def input_listdir(dir, wildcards):
>
>
>   def parse_iomem(pcidevices):
> -    regions =3D IOMemRegionTree.parse_iomem_tree(
> +    (regions, dmar_regions) =3D IOMemRegionTree.parse_iomem_tree(
>           IOMemRegionTree.parse_iomem_file())
>
>       rom_region =3D MemRegion(0xc0000, 0xdffff, 'ROMs')
>       add_rom_region =3D False
>
>       ret =3D []
> -    dmar_regions =3D []
>       for r in regions:
>           append_r =3D True
>           # filter the list for MSI-X pages
> @@ -860,21 +859,21 @@ class IOMemRegionTree:
>
>           return root
>
> -    # find HPET regions in tree
> +    # find specific regions in tree
>       @staticmethod
> -    def find_hpet_regions(tree):
> +    def find_regions_by_name(tree, string):
>           regions =3D []
>
>           for tree in tree.children:
>               r =3D tree.region
>               s =3D r.typestr
>
> -            if (s.find('HPET') >=3D 0):
> +            if (s.find(string) >=3D 0):
>                   regions.append(r)
>
>               # if the tree continues recurse further down ...
>               if (len(tree.children) > 0):
> -                regions.extend(IOMemRegionTree.find_hpet_regions(tree))
> +                regions.extend(IOMemRegionTree.find_regions_by_name(tree=
, string))
>
>           return regions
>
> @@ -882,6 +881,7 @@ class IOMemRegionTree:
>       @staticmethod
>       def parse_iomem_tree(tree):
>           regions =3D []
> +        dmar_regions =3D []
>
>           for tree in tree.children:
>               r =3D tree.region
> @@ -901,20 +901,23 @@ class IOMemRegionTree:
>               ):
>                   continue
>
> -            # generally blacklisted, unless we find an HPET behind it
> +            # generally blacklisted, with a few exceptions
>               if (s.lower() =3D=3D 'reserved'):
> -                regions.extend(IOMemRegionTree.find_hpet_regions(tree))
> +                regions.extend(IOMemRegionTree.find_regions_by_name(tree=
, 'HPET'))
> +                dmar_regions.extend(IOMemRegionTree.find_regions_by_name=
(tree, 'dmar'))
>                   continue
>
>               # if the tree continues recurse further down ...
>               if (len(tree.children) > 0):
> -                regions.extend(IOMemRegionTree.parse_iomem_tree(tree))
> +                (temp_regions, temp_dmar_regions) =3D IOMemRegionTree.pa=
rse_iomem_tree(tree)
> +                regions.extend(temp_regions)
> +                dmar_regions.extend(temp_dmar_regions)
>                   continue
>
>               # add all remaining leaves
>               regions.append(r)
>
> -        return regions
> +        return regions, dmar_regions
>
>
>   class IOMMUConfig:
>

Thanks, applied with style adjustments (pep8).

To avoid that your patch get's lost in a thread, at least make sure that th=
e
subject is the one of the patch. Again, git send-email will likely work bet=
ter
than manually copying into an email client (unless you know exactly what ne=
eds
to be set).

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/99d010c0-a646-2109-e575-51daf26d53b9%40web.de.
For more options, visit https://groups.google.com/d/optout.
