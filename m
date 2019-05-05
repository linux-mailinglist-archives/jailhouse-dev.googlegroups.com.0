Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBFUAXTTAKGQEZGUAGOQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC6214098
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 May 2019 17:24:07 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id w15sf3219150wrt.13
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 May 2019 08:24:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557069846; cv=pass;
        d=google.com; s=arc-20160816;
        b=0UuI5AHJz2X4ui2KQPyTm5KLPuOLNbPajtGQulA1f7eoAABPcQ+oNzn7TzVZUEYkzL
         10nJedTYV6iHRoUTvUZ+GB1xQRqBo39xeHhD8GXdGiDz+owRDQB/vt7HBG9C17vskA5B
         ZKBujqFxmYSxiSHQDv3UVzG5vhMH2I35U5ZkGoxeY2eoaXpLVNf3BLoRNyvf4rt6koCN
         9vvp/CJDbqbCPAz3tQ2vFL5ZvOnMCrmtJinFswHEy9wDA4lQH2etb3qcd9FAzAZA5Lv0
         Z0QxBfxBWrpxR1JdteOf/NHw/j+8WCdC8xfABweSzPXMl5SVYYtG6VaYScXvne+OncY6
         QAtg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=zHMd0qOSFc94JC0jC+mvqmSY04ljhU37bov6usXa5c8=;
        b=nqFGliw0I59TmipmFOlT6zSHpTsCH+TFakAw011JJcT12eJjWZjKontZ+edosJP6gc
         vtwrRv/OU+dl6K4ukeMBCSpJzY1TH88b7FKmCMHMAhCzly4+lVuhDkkRWkriCWeUNk/5
         h4kJlmtkkpkkDyg5TwwFzmMvF4zOOgGJtLgk9OrNFP4oHMNfwIxe1LlMTf5G+u21Pp6K
         e0mn2ozQ4CysxcpXWevWNU6WB/BkUoFZUojX272EJHdeGzchBlrlsjvVvYcI/8iv6rgF
         70A/FPGm+41t+zmxSmFwoFPrcCvQMqD5ra0alHDrYJrndQobvePm0kYEAT+pUnLO78E7
         rwXA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=iK+D89sD;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zHMd0qOSFc94JC0jC+mvqmSY04ljhU37bov6usXa5c8=;
        b=hVg16y0eZX6kFt3tpOj1/nTMcnash2tVljUbJLnfZ4f5yGxfg1vjsF1xPa8e9EXGJK
         VBRB/p5Jc4fded1zcvYFcGKD0ci6Ml9EcNcHOlP83916tEctCJruUA63cxJNd/mXIWx5
         bVg0q34dIn1QD/ESOupO/wMGSFr/D4YWByv17w71DgrO5Jb52GJCMoC9P72WjDMAU4li
         QlBpV+5qAhSuAOf55qmatrwsoJbEq63/9Lkpf/Wihu3uvzAtiJXFwDt0eZwBfzZebAA4
         IMg1AW5WD6VF+5B8AhnwFxaNVqXBM4yBDVvpcOPytlvL/qPYKPuCm8Qbfda2s8CJsO/O
         VxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zHMd0qOSFc94JC0jC+mvqmSY04ljhU37bov6usXa5c8=;
        b=Mldkxe2p2OhKKbi9CqeTSZmAXSA9l7ZbwWrZbr/u6y2+uVBVkQXYFAoIxfRfYaHNaP
         UJRGeVKgDt4ohCTW+siz9a1zoI5sAsW94931AX/5go/TWqcHrPhRJkzxgaixp+J66Hqw
         frK2Pm/xZ3i5JKTeYrpinAfGJDKVgeKYqJaB4wsWYiBShzVGAV8Cy7y+XLWe7851wqGx
         /jEmnPi5MwLb4s23XIiBvSys9SPGvC449WWs2fHofRJwopJ3V7wL9Rj7V//9cR85d5+H
         /UYgdjI/pothnl5JJHq2Tpnhd9EPnMpsnBaO/9FyXxXSZM8z4vrS2xDkERiG5TTPa8qG
         hGUA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVH/12i4GonJOtpba5A6Wf4xiXcQtjuncOGiC3DW3OsuDhgdcDF
	73ZQh1G1HIfO84V9U6xMY1Q=
X-Google-Smtp-Source: APXvYqymsRPtLRebQGoHpr9KJMZD3sloncozZYBmjRE2dVmE3Cg7QPPOhr0Tv4s4ETGpn9wOv53Uqw==
X-Received: by 2002:adf:e888:: with SMTP id d8mr14444814wrm.217.1557069846834;
        Sun, 05 May 2019 08:24:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f80f:: with SMTP id s15ls272497wrp.8.gmail; Sun, 05 May
 2019 08:24:06 -0700 (PDT)
X-Received: by 2002:adf:90ef:: with SMTP id i102mr12636546wri.133.1557069846057;
        Sun, 05 May 2019 08:24:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557069846; cv=none;
        d=google.com; s=arc-20160816;
        b=jXUzS96IxuLsopNu230eEGNZw7icgeJJ58kp4/N0DzfPsXz9hRBkZjakgTonaZ6A5z
         geXrKU0e5sKvWIWsVtAYdr0bkWEdTGOiTu1PCq33C9GZhlmN7aAR9fzLBfNazSnYwFhQ
         rneDvb/LGUPzPbEpRqY/gBg1kVONnVdo+RLRW8EE2W0sH4361eoSXZ74bTTB5Qkl88uY
         VOHLbggAX1ZFJrhc9V+nsCiH4G3HeX1Iat4s6788yPeEODk0eefB+Y5oLHisBEtF3/N+
         P+/IkUbSMmhugADbwr/CN36BKb1DMeTtcCbrzVxJQ7nn2euW6aVpm5SXBpuiWCkt3N5v
         M7Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=6DkeLwEjMGbtqqKZ2ASo1kVVdIGhw6+i1M00uigLKFk=;
        b=EonEEgBDAukzQs8aYumSpv200L/GL/2gUv03AKfydEmS47crOIakxdyIArz0JyaWWY
         L3dL5vN1GvtZnV7uxKoyuoXcGk510mu2apxYLB1HBS89n986989cUz2E4DCMd+qjiPg6
         A1d+7kub2XL7mP/dNvSLwhzCskuhn9RdskeEmpRrE31NRw3/POtfDrCZmw71QcqCnlAw
         f0tjZr72a1weDl08PHtQRXKy9sPvONlamOgOhSnSYqzE/KJjwArRc3keJMtncS8fgbsL
         RVHMcHvXyd3LA0G480oVtC3M0fL5hbfDgAXc7g/B1NEFkQS/jW5ZtY/85/pfFOrOOrkT
         RxWA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=iK+D89sD;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id f188si282414wme.0.2019.05.05.08.24.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 May 2019 08:24:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Ldn2d-1gwG3C2U55-00ixsx; Sun, 05
 May 2019 17:24:05 +0200
Subject: Re: JAILHOUSE hangs with exception when trying to enable the root
 cell
To: =?UTF-8?Q?Hakk=c4=b1_Kurumahmut?= <hkurumahmut84@hotmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <16e3b6ef-37e1-4734-aba4-247bcbbc18e0@googlegroups.com>
 <81bb9c90-1557-47ae-990d-b1bf417a58b9@googlegroups.com>
 <63f974a9-5944-4f1f-77a2-4bd7393ff8a6@siemens.com>
 <05d90171-db1f-4031-a7b2-48570eb37847@googlegroups.com>
 <fdfcd6e7-e2a5-4187-b079-ca643fb281a1@googlegroups.com>
 <32bc2861-e11e-4ab0-bdcf-063e2c05318d@googlegroups.com>
 <f704088f-99c1-4ec0-bd5e-90e15874cc7d@googlegroups.com>
 <3e5ad4e4-abac-03f5-5402-661e62a83944@siemens.com>
 <7f55a310-7bb7-4a3f-b111-0c2a24939b7c@googlegroups.com>
 <1f880925-0420-7c15-1aa4-07d001a6efce@siemens.com>
 <bcd32c87-28e7-4747-b3ab-ebaedf160309@googlegroups.com>
 <32d0b346-10e4-de18-1d24-95e4e4cff977@web.de>
 <9732f874-1271-4296-b2ef-ededba614a87@googlegroups.com>
 <7deff203-cf29-6353-128a-8b40f8d42584@web.de>
 <cbeb1b02-5799-472c-bb5c-f6eb62a60305@googlegroups.com>
 <8ef112a9-2f0f-9205-3e67-f0c6fed498ba@siemens.com>
 <3cb885a7-8b66-42b4-adf2-6fc98375efa9@googlegroups.com>
 <26834bed-4a78-4bac-b093-d8f9e2646e72@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <0288d0e8-0cc2-9dfd-3c01-f34a8ba981f6@web.de>
Date: Sun, 5 May 2019 17:24:05 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <26834bed-4a78-4bac-b093-d8f9e2646e72@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YrfBGk22acqlcC/qOeickif0oRJ0q+G4iF5d7nuh8kF77feNBTM
 EKRIE47znCsUNk2x7It5XUDAb8B/RMNkMPgvcbZoBN65Rw3/4miPQhTT/s5BFDQIL+BiBKz
 XwJlacAxqg6mjAMHZHD6uwzKj22IKTIp9lQdC3c2NGpjrIv1AAgRwqAVlXu6bX4MIC878tK
 fsTxgYiyc6ahc4xsJe79g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:KEFnpF6Xiuk=:2ckixvQ+Fe6I8bvi4R164b
 EKJx1jvtZiQfTahXVkpmwgKsWY7EvjZlLNC0Wo92uNXBD1Qfm/Puf2h9YRccv84RASXJxuWZ6
 LKNcEhro4MriFwFHNtnJNZGgaGpX65Y9wrEhbYdRsYxf5EbYEFj/xXxZ7Xjjbj2JaWTZirr9Y
 lbdC0KU8LZNrGO2TfCSKe8viFqfNKyM8QqvyMX5+bvBdOowbJcbIme4c9TLQwNwxv3v8V7l+T
 LyjwpMK5EbAWeXmAbIJsQP2VJLN0iTIKp75qniAxdJlrypJsUbuD3jpIbYbPs7u1NFndDAwYi
 ZCQHm5rdXtgxQTbO2UkIwK8mv4XxeceCafiMf2pxH8l687dmJ+dy4onoYDvcGS78hOGYIJcAN
 9jv5wuh+trZ6nK2CiqpdNNkUc7h9RDd4DT/LJV+5a1bRIKCS2955Nx1/bo2dT1M6X6Cym5rTz
 my+5XVuhNdOUuy0+jNAFX+bLwAD5w0R8KstXpdttoNuHcV43sfnvEkOSb54dr8wAlgGDPZ+55
 ALbUCgDCYOSXhQdxrNzcs11V8UXbd1w7UX7nGkTbva2Cs6Qck7TTAEgaZbjbC9eGVTC+KUNR1
 UUxVoctjcJtmHooJecqiK15d4k+2EXBruKlg1g7bFBjm592Kwl/DR9+fMdW5v/UafVqLCN3dX
 ACBTWMHhb/vlNpvEp6JDA5bdskeS2ovPFV2UFrLK1ASXK4fhQE8w+ZfjhL2aY+ssn9kke0iU/
 bLTM0XwkIuNlL05GLzzEZYQqY2fRNu2FbO4yf9xrq6ut/NLSHLSuNFKJIV833RIlHXYHtw4i/
 uJmfs+jVNA+93XYl/YE27O1e5ecdv2NoY+JFszHKWZJHTRypPHZAvUMBuLaRU59BJxKO7EQcr
 gKPyZT0/yuvaQWqjvnNe5id/HtAkfCforc1E8PX7kYAI/QRMc2IVOdMK2QwDrvPQN7NlO2LQk
 DsyIqp2kbVg==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=iK+D89sD;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 29.04.19 23:04, Hakk=C4=B1 Kurumahmut wrote:
> Hi Jan,
>
> I have write new patch that is attached below: (for jailhouse master bran=
ch)
>
> It is not touch to tree only update dmar_regions variable.
>
>
> git diff
> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> index 46c95fc2..70fe8869 100644
> --- a/pyjailhouse/sysfs_parser.py
> +++ b/pyjailhouse/sysfs_parser.py
> @@ -94,14 +94,13 @@ def input_listdir(dir, wildcards):
>
>
>   def parse_iomem(pcidevices):
> -    regions =3D IOMemRegionTree.parse_iomem_tree(
> -        IOMemRegionTree.parse_iomem_file())
> +    dmar_regions =3D []
> +    regions =3D IOMemRegionTree.parse_iomem_tree(IOMemRegionTree.parse_i=
omem_file(), dmar_regions)
>
>       rom_region =3D MemRegion(0xc0000, 0xdffff, 'ROMs')
>       add_rom_region =3D False
>
>       ret =3D []
> -    dmar_regions =3D []
>       for r in regions:
>           append_r =3D True
>           # filter the list for MSI-X pages
> @@ -878,9 +877,27 @@ class IOMemRegionTree:
>
>           return regions
>
> +    # find DMAR regions in tree
> +    @staticmethod
> +    def find_dmar_regions(tree):
> +        regions =3D []
> +
> +        for tree in tree.children:
> +            r =3D tree.region
> +            s =3D r.typestr
> +
> +            if (s.find('dmar') >=3D 0):
> +                regions.append(r)
> +
> +            # if the tree continues recurse further down ...
> +            if (len(tree.children) > 0):
> +                regions.extend(IOMemRegionTree.find_dmar_regions(tree))
> +
> +        return regions
> +
>       # recurse down the tree
>       @staticmethod
> -    def parse_iomem_tree(tree):
> +    def parse_iomem_tree(tree, dmar_regions):
>           regions =3D []
>
>           for tree in tree.children:
> @@ -904,11 +921,12 @@ class IOMemRegionTree:
>               # generally blacklisted, unless we find an HPET behind it
>               if (s.lower() =3D=3D 'reserved'):
>                   regions.extend(IOMemRegionTree.find_hpet_regions(tree))
> +                dmar_regions.extend(IOMemRegionTree.find_dmar_regions(tr=
ee))
>                   continue
>
>               # if the tree continues recurse further down ...
>               if (len(tree.children) > 0):
> -                regions.extend(IOMemRegionTree.parse_iomem_tree(tree))
> +                regions.extend(IOMemRegionTree.parse_iomem_tree(tree, dm=
ar_regions))
>                   continue
>
>               # add all remaining leaves
>

OK, sorry, now I get the point and the difference to your previous patch
version. Generally, this makes sense and does not widen the access incorrec=
tly.
Can you send this as proper patch (subject, description, signed-off)?

I would further refactor things at this chance (additional patch) and move =
the
dmar filtering we have in parse_iomem also into parse_iomem_tree. That avoi=
ds
the back and forth with first adding the region and then filtering it out a=
gain.
Now that we fill dmar_regions withing parse_iomem_tree, this makes even mor=
e sense.

One style thing regarding the interface of parse_iomem_tree: I'm no python =
guru
to say what is best, but it feels imbalanced that general regions are retur=
ned,
dmar regions are simply filled internally by passing the collected list int=
o the
parser. Shouldn't parse_iomem_tree better return a tuple of new general reg=
ions
and new dmar regions, and the caller will do the respective appending?

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
