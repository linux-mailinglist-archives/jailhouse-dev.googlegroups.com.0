Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB2UJ6WWAMGQETGV4ZCA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2F28286CC
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Jan 2024 14:06:52 +0100 (CET)
Received: by mail-wm1-x33c.google.com with SMTP id 5b1f17b1804b1-40e476c518esf3330035e9.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jan 2024 05:06:52 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704805612; cv=pass;
        d=google.com; s=arc-20160816;
        b=MxR45Q2/NYbISRTl2bALwx9y8npduTaWHRj0OFDImIf/4QXhHtYeOSDSv4s64FxSNp
         0hQ+B6q2MV8NZdRmlydpzmm15Owjj5UG8GQVBrXa2WLrYovlU5QiAL65UKV8k6qFb2TM
         A5sCaAIpAk+v80Z7uGe7MfIT0gJQgIJvH39OSVX6AtB0W90KSgprxEkGHGvSh4GqVspA
         4ZVGdQy+Ikg49qco/ODmvRgnIiCd0YtFoC8CLMz2latDt+z9obWV6QRreqdAF/UXV0Iu
         nd2WEwVO3p1yObBI9rv0mJ1wBpCs6zL0/WFOH8fD0QQ/0IgpnAAxehgpit7qRh/JKLs/
         gViw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=Y+FYJWf5BiO3I+7bNkc9B0ZG2fDIcORaG4YCCa5ZwAY=;
        fh=AmrO4dgiJcsriEKGfeYUx9aYBonJEBZZGKJohXjIX6o=;
        b=EzHbbBMar4kQr3vxCppyTyZRl7wQUuj66l8aQK5FI+yFEalGdogf88xANaT3+TjcvL
         HNCBQp6haBkM+v9nKYbBWnnl8drVw2b4Eoks3zoDVFotqGxTl+OGF9WQ8ohEGeaEO7uO
         l2nyV/YCe3PvZmbbhFOwSDPH7MifWgC5pWmzgdZKWoP+r17bMspDAIMozpzraK6Cddkn
         udyij/vJKcf8j8m4xzkY8MWKX1WfkRIwZRcu+fhyhVc7K4zF0sUDYHf14ErMcKqBz2lV
         a1Yi1fLx1g8iOp52oeDeXMcqahgkym4kp157tvleeEyhnTQsnASodgSGMCpcJG/J8VNq
         8C2g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=EBfkgFgv;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.233.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1704805612; x=1705410412; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+FYJWf5BiO3I+7bNkc9B0ZG2fDIcORaG4YCCa5ZwAY=;
        b=v3zPLTpa9ktc1fZandzqlVMEqMdhr3jd8tn7qprJZoBo+cqFKTPuXTKU/arNwTfZuA
         EzX3mmAKEXI6TlI7/ALb8JUC4K6NVxDnxZUhFsuUslWACoC5NjnD/+qLGPoo5caLrjRu
         x+1oTxDB5wbKfsDggcVE1clBtRlLbFUs841cMEpmfyWg6hlourLopfxWrWyGKweqXt8c
         tV3QLfhL22JDp16O3fELLyOOoEsx9XFUSeIahfZufXG6pcLLf6Wn002v+/1Pco9l2ZkJ
         iQngxK76nSQ3d0cuFHdWcr3X13mR4XmQEFQb7vZ8KFArrj5TuE0rQqhY73ZJU/Qeabet
         7h6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704805612; x=1705410412;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+FYJWf5BiO3I+7bNkc9B0ZG2fDIcORaG4YCCa5ZwAY=;
        b=k8r5PwPCCQyqt9agpWo4iwDhiB2v0PSa/EmNk7EhYkAVvxRNo0u2+GoQpB4wey4Wlu
         5MoFZZI4M8QyG8SKky1D7LYtbipp+ffdOrir6CERtHa8FwrNeUNjsbFCceRyD24q65yZ
         ccIBO9NNShyfQB3nd06OU3u/wY8YlMRweosHMrk34pmXsQnm7GeToP8EfMYHLYXnWThy
         iX/uWtCz6vgzW+JvgiSokymKXDYnUeVNEJJngGVVEfSiuQMHT03dy777EB3qYPwZgk9c
         T1fW9V7TMZZg2zuVX0oR3XTNNTI2s5ynnqUiXgiqCB4W0WhlQLm/QVVTmWI7bTWZGoiQ
         62uA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YwNaZzKTYbOkF8DJlqLpN1mO9YrWwWBBUlAnk2h+9YZnZeWDSvt
	6RSAvxQxy/afwX7HUQNDKUA=
X-Google-Smtp-Source: AGHT+IG/U1KdTyCarR9WwaREk8/TePrPorKdo5NxXujqbeu1WgqyrkAU5RXHOShfjVwT6xv3LQGmEw==
X-Received: by 2002:a05:600c:22da:b0:40e:4912:1df3 with SMTP id 26-20020a05600c22da00b0040e49121df3mr2758936wmg.3.1704805611486;
        Tue, 09 Jan 2024 05:06:51 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:3501:b0:40d:5e7d:9d04 with SMTP id
 h1-20020a05600c350100b0040d5e7d9d04ls1363040wmq.0.-pod-prod-00-eu; Tue, 09
 Jan 2024 05:06:49 -0800 (PST)
X-Received: by 2002:a7b:cd17:0:b0:40e:364d:d526 with SMTP id f23-20020a7bcd17000000b0040e364dd526mr475787wmj.87.1704805608710;
        Tue, 09 Jan 2024 05:06:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704805608; cv=none;
        d=google.com; s=arc-20160816;
        b=rddlG5er6D1BhkbCRoukc8n4ITw3gbM4aXRZFsfTMhSt0WFe0/U2n/DGkpCORbx7eZ
         d8mhXtGlR61AQXSNFbvNWXAyvOzd/ssQCpAx3b4ei1SKRTRNjHdfdBzWa9wHoNMz/jct
         224++T9IJsX3spM0Lew74O2B9unmujbsmbdKpn+vadgEnpluxdUuFxewXfc6M1qdOL9m
         0gDIP09QWOujPBL2nrvuOL4/miz6IIA0UQWlOugkVQZV41oNgzLuLDGqr4X/3L7dTPh/
         SqoU5qM6n5OdhmuHoz7GJ9RnadlvwkuiglkQ/WcqNDEYVZcXjFoY3JgOyNq/ao6nYG2h
         PApA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=pNCb1UT5Km5uRdraJiSD4TAgMdV0hLEeM81X/aO0zcs=;
        fh=AmrO4dgiJcsriEKGfeYUx9aYBonJEBZZGKJohXjIX6o=;
        b=qYbjIItOO9QyZ1J3H4a4ITZfRa7XodNYaFlSSmLSY5QbmHc9aCNiTORsJoFNOf0nam
         Ab54YdJRJl6VFrILN164va2+RwkDhdtgqg62fteRA2CBEJ+ETuOyfYCc0OxeaG0YwUZG
         HZoXr18XcoP5diVdU/mdvL1F2Rt4Zy5pDiIe6g5AAuuxJMWxrKnlvN4Z7L5LKzqRrP43
         ik21XQIsheQQuXJenLqqHhM2AzFyurbxJDBlPu6TwA+uPU9gRWK9lm6uMWMECAvmMO5p
         33mCvHPVqH1xeKAZ1qhS14RMxHD9UiAVrAsGJudmiGbS9DCfWAJH8zdAXRyceo9WIYB/
         dKiQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=EBfkgFgv;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.233.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from a2752.mx.srv.dfn.de (a2752.mx.srv.dfn.de. [194.95.233.60])
        by gmr-mx.google.com with ESMTPS id n41-20020a05600c3ba900b0040e35b75714si331173wms.0.2024.01.09.05.06.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 05:06:48 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.233.60 as permitted sender) client-ip=194.95.233.60;
Received: from mta03.hs-regensburg.de (mta03.hs-regensburg.de [IPv6:2001:638:a01:1096::13])
	by a2752.mx.srv.dfn.de (Postfix) with ESMTPS id AD4292E023A;
	Tue,  9 Jan 2024 14:06:47 +0100 (CET)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta03.hs-regensburg.de (Postfix) with ESMTPS id 4T8WRC1Dlgzxr8;
	Tue,  9 Jan 2024 14:06:47 +0100 (CET)
Received: from [IPV6:2001:638:a01:8068:f8d9:f11a:f164:a35a]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 9 Jan
 2024 14:06:46 +0100
Message-ID: <5c3e3764-107e-4faa-ba2c-3df02faf2f4f@oth-regensburg.de>
Date: Tue, 9 Jan 2024 14:06:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: i.MX8MP jailhouse load image stuck at copy_from_user
Content-Language: en-US
To: wheatfox <enkerewpo@gmail.com>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <f81eedab-debe-4d19-954a-06b55f2fa4a9n@googlegroups.com>
 <f42f3913-11ea-4b78-86cb-ab4fe76db882@oth-regensburg.de>
 <412a6c64-3a4d-4151-9293-05b9881f3418n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <412a6c64-3a4d-4151-9293-05b9881f3418n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta03-20220613 header.b=EBfkgFgv;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.233.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi,

read your log carefully:

[    0.444215] Unpacking initramfs...
[    0.447384] Initramfs unpacking failed: invalid magic at start of=20
compressed archive

Something is odd with your ramdisk. Maybe the wrong size is passed?

Thanks,
   Ralf

On 09/01/2024 13:19, wheatfox wrote:
> Thanks for your instruction! I tried to edit the linux inmate cell=20
> configuration file (imx8mp-linux-demo.c) and I finally get the linux=20
> inmate to boot, so I think it was mainly a memory region=20
> misconfiguration problem. (However, the boot progress failed due to VFS=
=20
> fatal error, which I will investigate later...)
> The current full output log is attached as attachment.
>=20
> On Monday, January 8, 2024 at 7:12:46=E2=80=AFPM UTC+8 Ralf Ramsauer wrot=
e:
>=20
>     Hi,
>=20
>     On 08/01/2024 09:26, wheatfox wrote:
>      > I'm using OK8MP board with=C2=A0i.MX8MP CPU. I have already starte=
d
>     jailhouse
>      > with imx8mp.cell configuration, and the example gic-demo works fin=
e.
>      > However, when I try to start a linux inmate using
>      > imx8mp-linux-demo.cell, the jailhouse's load progress seems stuck.
>      >
>      > After adding some debug print in jailhouse's python script, firmwa=
re
>      > code and kernel module code, I found out that the
>     *copy_from_user* call
>      > in *load_image*=C2=A0function (driver/cell.c) doesn't return and h=
alt
>     forever: >
>      > jailhouse commands:
>      > ./tools/jailhouse enable ./imx8mp.cell
>      > ./tools/jailhouse cell linux \
>      > ./imx8mp-linux-demo.cell \
>      > ./kernel/Image \
>      > -i ./kernel/ramdisk.img \
>=20
>     For testing, try to not load the ramdisk. The kernel should at least
>     boot and crash. If that works, we know that there's something odd wit=
h
>     the ramdisk.
>=20
>     Second, double and triple check addresses where things get loaded.
>     What's in your non-root cell configuration, and where does the
>     linux-loader try to load stuff? Does that match?
>=20
>     Thanks,
>     Ralf
>=20
>      > -d ./kernel/imx8mp-evk-inmate-wheatfox.dtb \
>      > -c "clk_ignore_unused console=3Dttymxc1,0x30890000,115200
>      > earlycon=3Dec_imx6q,0x30890000,115200"
>      >
>      > start linux cell output(with the string 'wheatfox' means it's my
>     custom
>      > debug print):
>      > root@OK8MP:/mnt# ./start-linux.sh
>      > [wheatfox|python] Jailhouse Linux Cell Boot Helper
>      > [wheatfox|python] linux_loader=3D/m[ =C2=A0129.965933] [wheatfox]
>      > (jailhouse_ioctl) ioctl=3D0x5401 arg=3D281474720244744
>      > nt/tools/../inmates/tools/arm64/l[ =C2=A0129.975611] [wheatfox]
>      > (jailhouse_ioctl) ioctl=3D0x5401 arg=3D281474720244728
>      > inux-loader.bin
>      > [ =C2=A0129.988033] [wheatfox] (jailhouse_ioctl) ioctl=3D0x4010000=
2
>      > arg=3D281474720244800
>      > [ =C2=A0129.995192] [wheatfox] (jailhouse_ioctl) JAILHOUSE_CELL_CR=
EATE
>      > [ =C2=A0130.001072] [wheatfox] (jailhouse_cmd_cell_create) start
>      > [ =C2=A0130.006404] [wheatfox] (jailhouse_cmd_cell_create)
>     copy_from_user done
>      > [ =C2=A0130.012960] [wheatfox] (jailhouse_cmd_cell_create)
>     copy_from_user done
>      > [ =C2=A0130.019507] [wheatfox] (jailhouse_cmd_cell_create) cell_id=
.id
>     <http://cell_id.id> =3D -1
>      > [ =C2=A0130.095151] IRQ 6: no longer affine to CPU2
>      > [ =C2=A0130.095333] CPU2: shutdown
>      > [ =C2=A0130.102251] psci: CPU2 killed (polled 0 ms)
>      > [ =C2=A0130.155283] CPU3: shutdown
>      > [ =C2=A0130.157999] psci: CPU3 killed (polled 0 ms)
>      > [wheatfox] in hypercall, code =3D 1, arg1 =3D 2955416576, arg2 =3D=
 2
>      > [wheatfox] in hypercall, JAILHOUSE_HC_CELL_CREATE
>      > Adding virtual PCI device 00:00.0 to cell "linux-inmate-demo"
>      > Shared memory connection established, peer cells:
>      > =C2=A0"imx8mp"
>      > Adding virtual PCI device 00:01.0 to cell "linux-inmate-demo"
>      > Shared memory connection established, peer cells:
>      > =C2=A0"imx8mp"
>      > [wheatfox] in resume_cpu, cpu_id =3D 2
>      > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
>      > [wheatfox] in resume_cpu, cpu_id =3D 3
>      > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
>      > Created cell "linux-inmate-demo"
>      > Page pool usage after cell creation: mem 82/992, remap 144/131072
>      > [wheatfox] in resume_cpu, cpu_id =3D 0
>      > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
>      > [ =C2=A0130.231800] [wheatfox] (jailhouse_cmd_cell_create) Created=
 cell
>      > "linux-inmate-demo"
>      > [wheatfox|python] cell created,
>      >
>     name=3Db'linux-inmate-demo\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x0=
0\x00\x00\x00\x00'
>      > [wheatf[ =C2=A0130.249264] [wheatfox] (jailhouse_ioctl) ioctl=3D0x=
40300003
>      > arg=3D281474720245360
>      > ox|python] trying to load linux_l[ =C2=A0130.257905] [wheatfox]
>      > (jailhouse_ioctl) JAILHOUSE_CELL_LOAD
>      > oader.bin into cell, addr=3D0x0
>      > [ =C2=A0130.266684] [wheatfox] (jailhouse_cmd_cell_load) start
>      > [ =C2=A0130.274322] [wheatfox] (jailhouse_cmd_cell_load)
>      > cell_management_prologue(&cell_load.cell_id, &cell) done
>      > [wheatfox] in hypercall, code =3D 3, arg1 =3D 1, arg2 =3D
>     4308871775073466112
>      > [wheatfox] in hypercall, JAILHOUSE_HC_CELL_SET_LOADABLE
>      > [wheatfox] in cell_set_loadable, id =3D 1
>      > [wheatfox] cell_management_prologue finished
>      > [wheatfox] in resume_cpu, cpu_id =3D 2
>      > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
>      > [wheatfox] in resume_cpu, cpu_id =3D 3
>      > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
>      > [wheatfox] finished arch_park_cpu
>      > [wheatfox] cell->loadable =3D 0
>      > [wheatfox] not jumped to out_resume
>      > Cell "linux-inmate-demo" can be loaded
>      > [wheatfox] in out_resume
>      > [wheatfox] in resume_cpu, cpu_id =3D 1
>      > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
>      > [ =C2=A0130.342417] [wheatfox] (jailhouse_cmd_cell_load)
>      > jailhouse_call_arg1(JAILHOUSE_HC_CELL_SET_LOADABLE, cell->id) done
>      > [ =C2=A0130.353079] [wheatfox] (jailhouse_cmd_cell_load)
>      > cell_load.num_preload_images =3D 1
>      > [ =C2=A0130.360584] [wheatfox] (jailhouse_cmd_cell_load) load_imag=
e(cell,
>      > image) start, n =3D 1
>      > [ =C2=A0130.368444] [wheatfox] (load_image) start
>      > [ =C2=A0130.372468] [wheatfox] (load_image) copy_from_user done
>      > [ =C2=A0130.377712] [wheatfox] (load_image) image.size =3D 34b0
>      > [ =C2=A0130.382776] [wheatfox] (load_image) found suitable memory =
region,
>      > mem->virt_start =3D 0, mem->size =3D 10000
>      > [ =C2=A0130.392280] [wheatfox] (load_image) image load mem region =
found
>      > [ =C2=A0130.398228] [wheatfox] (load_image) phys_start =3D fdb0000=
0
>      > [ =C2=A0130.403653] [wheatfox] (load_image) page_offs =3D 0
>      > [ =C2=A0130.408373] [wheatfox] (load_image) image_mem =3D 00000000=
79dd6ce3
>      > [ =C2=A0130.414405] [wheatfox] (load_image) copy_from_user params:
>      > [ =C2=A0130.419905] [wheatfox] (load_image) to =3D 0000000079dd6ce=
3
>      > [ =C2=A0130.425329] [wheatfox] (load_image) from =3D 00000000c239e=
c71
>      > [ =C2=A0130.430915] [wheatfox] (load_image) n =3D 34b0
>      > [ =C2=A0130.435220] [wheatfox] (load_image) copy_from_user start
>      > [ =C2=A0130.440563] [wheatfox] (load_image) copy_from_user done
>      > [ =C2=A0130.445822] [wheatfox] (load_image) flush_icache_range don=
e
>      > [ =C2=A0130.451429] [wheatfox] (jailhouse_cmd_cell_load) load_imag=
e(cell,
>      > image) done, n =3D 1
>      > [ =C2=A0130.459186] [wheatfox] (jailhouse_cmd_cell_load) unlock_ou=
t done,
>      > exiting jailhouse_cmd_cell_load
>      > [wheatfox|python] linux_loader.bin loaded
>      > [wheatfox|python] trying to load kernel into cell, addr=3D0xc02800=
00
>      > [ =C2=A0130.500262] [wheatfox] (jailhouse_ioctl) ioctl=3D0x4030000=
3
>      > arg=3D281474720245360
>      > [ =C2=A0130.507454] [wheatfox] (jailhouse_ioctl) JAILHOUSE_CELL_LO=
AD
>      > [ =C2=A0130.513165] [wheatfox] (jailhouse_cmd_cell_load) start
>      > [ =C2=A0130.518321] [wheatfox] (jailhouse_cmd_cell_load)
>      > cell_management_prologue(&cell_load.cell_id, &cell) done
>      > [wheatfox] in hypercall, code =3D 3, arg1 =3D 1, arg2 =3D
>     4308871775073466112
>      > [wheatfox] in hypercall, JAILHOUSE_HC_CELL_SET_LOADABLE
>      > [wheatfox] in cell_set_loadable, id =3D 1
>      > [wheatfox] cell_management_prologue finished
>      > [wheatfox] in resume_cpu, cpu_id =3D 2
>      > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
>      > [wheatfox] in resume_cpu, cpu_id =3D 3
>      > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
>      > [wheatfox] finished arch_park_cpu
>      > [wheatfox] cell->loadable =3D 1
>      > [wheatfox] in out_resume
>      > [wheatfox] in resume_cpu, cpu_id =3D 1
>      > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
>      > [ =C2=A0130.579626] [wheatfox] (jailhouse_cmd_cell_load)
>      > jailhouse_call_arg1(JAILHOUSE_HC_CELL_SET_LOADABLE, cell->id) done
>      > [ =C2=A0130.590182] [wheatfox] (jailhouse_cmd_cell_load)
>      > cell_load.num_preload_images =3D 1
>      > [ =C2=A0130.597678] [wheatfox] (jailhouse_cmd_cell_load) load_imag=
e(cell,
>      > image) start, n =3D 1
>      > [ =C2=A0130.605532] [wheatfox] (load_image) start
>      > [ =C2=A0130.609557] [wheatfox] (load_image) copy_from_user done
>      > [ =C2=A0130.614795] [wheatfox] (load_image) image.size =3D 1ab7200
>      > [ =C2=A0130.620131] [wheatfox] (load_image) found suitable memory =
region,
>      > mem->virt_start =3D c0000000, mem->size =3D 3d700000
>      > [ =C2=A0130.630505] [wheatfox] (load_image) image load mem region =
found
>      > [ =C2=A0130.636699] [wheatfox] (load_image) phys_start =3D c028000=
0
>      > [ =C2=A0130.642128] [wheatfox] (load_image) page_offs =3D 0
>      > [ =C2=A0130.646853] [wheatfox] (load_image) image_mem =3D 00000000=
7135b443
>      > [ =C2=A0130.652883] [wheatfox] (load_image) copy_from_user params:
>      > [ =C2=A0130.658387] [wheatfox] (load_image) to =3D 000000007135b44=
3
>      > [ =C2=A0130.663808] [wheatfox] (load_image) from =3D 00000000ebdde=
5d4
>      > [ =C2=A0130.669399] [wheatfox] (load_image) n =3D 1ab7200
>      > [ =C2=A0130.673952] [wheatfox] (load_image) copy_from_user start
>      >
>      > then nothing happens after this 'copy_from_user start`, the
>     source code is:
>      > printk("[wheatfox] (load_image) copy_from_user start\n");
>      > if (copy_from_user(image_mem + page_offs,
>      > (void __user *)(unsigned long)image.source_address,
>      > image.size))
>      > err =3D -EFAULT;
>      > printk("[wheatfox] (load_image) copy_from_user done\n");
>      >
>      >
>      > --
>      > You received this message because you are subscribed to the Google
>      > Groups "Jailhouse" group.
>      > To unsubscribe from this group and stop receiving emails from it,
>     send
>      > an email to jailhouse-de...@googlegroups.com
>      > <mailto:jailhouse-de...@googlegroups.com>.
>      > To view this discussion on the web visit
>      >
>     https://groups.google.com/d/msgid/jailhouse-dev/f81eedab-debe-4d19-95=
4a-06b55f2fa4a9n%40googlegroups.com <https://groups.google.com/d/msgid/jail=
house-dev/f81eedab-debe-4d19-954a-06b55f2fa4a9n%40googlegroups.com> <https:=
//groups.google.com/d/msgid/jailhouse-dev/f81eedab-debe-4d19-954a-06b55f2fa=
4a9n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter <https://gro=
ups.google.com/d/msgid/jailhouse-dev/f81eedab-debe-4d19-954a-06b55f2fa4a9n%=
40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>.
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/412a6c64-3a4d-4151-9293-0=
5b9881f3418n%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/412a6c64-3a4d-4151-9293-05b9881f3418n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5c3e3764-107e-4faa-ba2c-3df02faf2f4f%40oth-regensburg.de.
