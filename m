Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB4MK6WWAMGQEOCRI6KI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 2939F8286D6
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Jan 2024 14:09:08 +0100 (CET)
Received: by mail-lf1-x140.google.com with SMTP id 2adb3069b0e04-50e91f9d422sf2229411e87.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jan 2024 05:09:08 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704805747; cv=pass;
        d=google.com; s=arc-20160816;
        b=I02QmB2K2k+zvU9XZfyDuzHgldFFmoVwg1H1pLfk4PSGgnIN/PG46S38JLHhX4ExJQ
         5yEF6/0ElugSwUhbO99AG6GML7Jo77nBR84TpxJN3DxLOKhIDYlKLmf27OXlllffMRg+
         Z+ms+AtzQ1kae6jFOrSgsud01Ru1bEdvAENaXZNSrbVRE5mTfCBS5cSQ5g2bLUALVLlG
         Lq+6NiX5EBeKAuZAzebkXw5gIAtx4GrOiU4rJb6s29oBMVfsvqHO4qNIQEzcxobD71Cq
         6HirLvND8MKZ5i0j6SaNG5CEhBGYxF9EmpDdiPYD9eRbbb7SivQHULQgUvMBsIqzTe0x
         SYbw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=YrwF1pytOBBz4Vx5V8wM0nJGBCtIHUHdoC2gx9bcdh0=;
        fh=AmrO4dgiJcsriEKGfeYUx9aYBonJEBZZGKJohXjIX6o=;
        b=qBBYHZyFESrGlr9garSPmGwirF911ZSKav+dGtjq9ZRY6/Efciv42I1JAu2X4JC8a9
         /FZLnzCPJ0m0pROCT8dez6Yzhq3dkYQQucMFlizSW6uyGP6WBgE3O/fQP/Ts89uzwcjC
         pIYk59JDSHNZ3Ez86Y/xusfq2o2dL2RpyXtv9O9sJB6eWAYBPupKkGb3qFCdVisWpmjw
         W+VBXgTXPPNv2d378cDtAGm2ZqFmX8L5yF8diGDbfeliIbCjVVXw228wh2PRoKEB349p
         77l+dmeMMqzObk0QVIkGRZUl6CWXmf7oxhFEoU0hGZvPRTnrnoSCf3yyI6AYk8/sA+de
         5geg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=L3RAUnnh;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.239.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1704805747; x=1705410547; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=YrwF1pytOBBz4Vx5V8wM0nJGBCtIHUHdoC2gx9bcdh0=;
        b=WC8ES2KR2NWkhzALgq1hSJWvxMf7JOeSORVztOnMieEq2yY3MKz9p5UYCsc1EFoIRp
         S/StqAJqIr8KfwqHaljiXP4t1mNn0k1Q1zhbYyPNAbil+eksfZW5DBZxJndQ+WkDNbh3
         40OIrEypHCIgq7S1NhvkiG0nUPLk7QXV78v3319XrS9feeSmgZkTMVFjwfVi5UkPjs6Q
         DhwdjJlMPTU60gHDKPc0Fzog212HCJeKfajliyou8O+SwMqTPfgQ3NpqTD3b4iExumzD
         p/hmKvmelisfGCwkUhyuUfNbC7IfcP9REh9swi/vj35QZ0t6rnk3mFSf4idTEUcvZEvp
         SrUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704805747; x=1705410547;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrwF1pytOBBz4Vx5V8wM0nJGBCtIHUHdoC2gx9bcdh0=;
        b=npyhI92PBfRfPzZSqldyt9yCghGuHKjtM4I2+wKyHVIuWs6UyAix6nTuisV4n4fUrF
         3C3NYX5e4Zbbdnwsy97HJj6yXMV5y6iezJOQ/Weyk5HSDEaiKhoXJEMHUy+lI2q5i1Gr
         EsPl1y09lp137pj0IrGAzUAD97YZXB1+vNbzMkH8FiDMYEbVkvUot0Xt+DZ3IQO2zkJE
         djsN2wMXcHSZ2eecNZUuqCqTKDQsddNVLSpSmDz4Jv/u2a+tdFVmW1fcwGckApM/zVST
         xyiE8V9dtcHjNWcGK+U0qRWCeB9sv0I8QR3j7DGu2/CHZafb1COUf9NSIbADBqttIpXl
         +m0Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yzg1Fs4pmwFzuZLU8S1IyxfsVHQ/qQknveQFvGLqmwFYA3LxEa+
	mkYsQZhUBy6jxr0vTBR3EOM=
X-Google-Smtp-Source: AGHT+IHtlrwAnJvefx2iV4oHriFeIQatww20XQow43YKV7gJ6F9G8jqNvkNREcCWasWakRUtlmdybg==
X-Received: by 2002:ac2:47f0:0:b0:50e:7b28:4573 with SMTP id b16-20020ac247f0000000b0050e7b284573mr1965620lfp.30.1704805745957;
        Tue, 09 Jan 2024 05:09:05 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:b94:b0:50e:7b0c:1610 with SMTP id
 b20-20020a0565120b9400b0050e7b0c1610ls760085lfv.2.-pod-prod-04-eu; Tue, 09
 Jan 2024 05:09:03 -0800 (PST)
X-Received: by 2002:a05:6512:3d07:b0:50e:b3dc:3ea5 with SMTP id d7-20020a0565123d0700b0050eb3dc3ea5mr3023718lfv.66.1704805743327;
        Tue, 09 Jan 2024 05:09:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704805743; cv=none;
        d=google.com; s=arc-20160816;
        b=ayyh2ZNLLgogPFQZvJK2GxvM4i6rNueqq8JYllyCVRYawNmxna7pNEm+RrRCPzI+8h
         0mGHWfGJhqr/tdi4WKGcTuHTYt8J2VZ4ReYIXEo+MLGeB7ZpZ+lw+mCOq6u3h2KEq/St
         IUqZQ/vI5XTwSbVXAsQ7IB56IQoXqpdD6+BKbsFYQbVDbknaiy7rcAdp2mAl72BHI53E
         mjml+g2M0XfQLG9gfR13v+80f8TK5PN27eksutv0Ck4PsK3hZ5z302f3Pzf8zj+xz7Vq
         NRMfEnw3WnkFOvPBysDu3jNUzO6mynvFPBdn2GQv6y0wAFdsvU6OVApE8QjW2lQUhcSZ
         YgOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4y/kEg+DKUktHebsq0pMnXNHc1QJAyZ1xmct1g8vac0=;
        fh=AmrO4dgiJcsriEKGfeYUx9aYBonJEBZZGKJohXjIX6o=;
        b=Bz0Z9lZmzqG0xYdQ9M6x9IPIMhOJfhl7WP6ypApKCbFFSuHXFfo8iHOGLjdrRUwBgZ
         pS18Wkl+pjeGHRrZJRIQTCNtwX8z3oFx3IVmJ2qfhyna3J02z45bgnGp50Rud0+Yh+jW
         TAA3cwxct9z3FBAZ7OI+sqd6l6ilroK5VPD0L0doH7uUyVlM5qUBwLwFfkls/M9Jz9JC
         ciBHeuL0bc+kTOiG9Rb99apbTvGqxvy7+K3jShUHEMK1l84UPlBIrHpIgzt8aOvTtfum
         ZScV0h7hcmQb3q1DNG5kxgMqz8h/7oFbJ+NWJ/xSvBswGxcLx02wNu2iKH1k2d8e7Big
         a7Zw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=L3RAUnnh;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.239.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from c2752.mx.srv.dfn.de (c2752.mx.srv.dfn.de. [194.95.239.60])
        by gmr-mx.google.com with ESMTPS id k20-20020ac24f14000000b0050e7a179cf3si44503lfr.2.2024.01.09.05.09.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 05:09:03 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.239.60 as permitted sender) client-ip=194.95.239.60;
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de [IPv6:2001:638:a01:1096::12])
	by c2752.mx.srv.dfn.de (Postfix) with ESMTPS id 93F3E2A0287;
	Tue,  9 Jan 2024 14:09:01 +0100 (CET)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4T8WTn1WlJzxsC;
	Tue,  9 Jan 2024 14:09:01 +0100 (CET)
Received: from [IPV6:2001:638:a01:8068:f8d9:f11a:f164:a35a]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 9 Jan
 2024 14:09:00 +0100
Message-ID: <cfa0c6a3-854f-4619-8e60-384823fb634e@oth-regensburg.de>
Date: Tue, 9 Jan 2024 14:09:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: i.MX8MP jailhouse load image stuck at copy_from_user
Content-Language: en-US
To: wheatfox <enkerewpo@gmail.com>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <f81eedab-debe-4d19-954a-06b55f2fa4a9n@googlegroups.com>
 <f42f3913-11ea-4b78-86cb-ab4fe76db882@oth-regensburg.de>
 <412a6c64-3a4d-4151-9293-05b9881f3418n@googlegroups.com>
 <91a64cf9-a3b4-419b-b030-fc3d295e577en@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <91a64cf9-a3b4-419b-b030-fc3d295e577en@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=L3RAUnnh;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.239.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

On 09/01/2024 13:33, wheatfox wrote:
> Here is my current linux inmate cell configuration for my OK8MP=20
> board(imx8mp CPU, 2G RAM + 16G eMMC version), I didn't change the=20
> imx8mp.c for now.

I don't understand what you're trying to tell.

> I edited the RAM region as:
> /* RAM */ {
> /*
>  =C2=A0* We could not use 0x80000000 which conflicts with
>  =C2=A0* COMM_REGION_BASE

And I don't understand this comment.

>  =C2=A0*/
> .phys_start =3D 0x60000000,
> .virt_start =3D 0x60000000,

For non-root cells, host physical and guest physical memory doesn't=20
necessarily have to be identity mapped.

   Ralf

> .size =3D 0x10000000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
> JAILHOUSE_MEM_LOADABLE,
> },
> On Tuesday, January 9, 2024 at 8:19:59=E2=80=AFPM UTC+8 wheatfox wrote:
>=20
>     Thanks for your instruction! I tried to edit the linux inmate cell
>     configuration file (imx8mp-linux-demo.c) and I finally get the linux
>     inmate to boot, so I think it was mainly a memory region
>     misconfiguration problem. (However, the boot progress failed due to
>     VFS fatal error, which I will investigate later...)
>     The current full output log is attached as attachment.
>=20
>     On Monday, January 8, 2024 at 7:12:46=E2=80=AFPM UTC+8 Ralf Ramsauer =
wrote:
>=20
>         Hi,
>=20
>         On 08/01/2024 09:26, wheatfox wrote:
>          > I'm using OK8MP board with=C2=A0i.MX8MP CPU. I have already
>         started jailhouse
>          > with imx8mp.cell configuration, and the example gic-demo
>         works fine.
>          > However, when I try to start a linux inmate using
>          > imx8mp-linux-demo.cell, the jailhouse's load progress seems
>         stuck.
>          >
>          > After adding some debug print in jailhouse's python script,
>         firmware
>          > code and kernel module code, I found out that the
>         *copy_from_user* call
>          > in *load_image*=C2=A0function (driver/cell.c) doesn't return a=
nd
>         halt forever: >
>          > jailhouse commands:
>          > ./tools/jailhouse enable ./imx8mp.cell
>          > ./tools/jailhouse cell linux \
>          > ./imx8mp-linux-demo.cell \
>          > ./kernel/Image \
>          > -i ./kernel/ramdisk.img \
>=20
>         For testing, try to not load the ramdisk. The kernel should at
>         least
>         boot and crash. If that works, we know that there's something
>         odd with
>         the ramdisk.
>=20
>         Second, double and triple check addresses where things get loaded=
.
>         What's in your non-root cell configuration, and where does the
>         linux-loader try to load stuff? Does that match?
>=20
>         Thanks,
>         Ralf
>=20
>          > -d ./kernel/imx8mp-evk-inmate-wheatfox.dtb \
>          > -c "clk_ignore_unused console=3Dttymxc1,0x30890000,115200
>          > earlycon=3Dec_imx6q,0x30890000,115200"
>          >
>          > start linux cell output(with the string 'wheatfox' means it's
>         my custom
>          > debug print):
>          > root@OK8MP:/mnt# ./start-linux.sh
>          > [wheatfox|python] Jailhouse Linux Cell Boot Helper
>          > [wheatfox|python] linux_loader=3D/m[ =C2=A0129.965933] [wheatf=
ox]
>          > (jailhouse_ioctl) ioctl=3D0x5401 arg=3D281474720244744
>          > nt/tools/../inmates/tools/arm64/l[ =C2=A0129.975611] [wheatfox=
]
>          > (jailhouse_ioctl) ioctl=3D0x5401 arg=3D281474720244728
>          > inux-loader.bin
>          > [ =C2=A0129.988033] [wheatfox] (jailhouse_ioctl) ioctl=3D0x401=
00002
>          > arg=3D281474720244800
>          > [ =C2=A0129.995192] [wheatfox] (jailhouse_ioctl)
>         JAILHOUSE_CELL_CREATE
>          > [ =C2=A0130.001072] [wheatfox] (jailhouse_cmd_cell_create) sta=
rt
>          > [ =C2=A0130.006404] [wheatfox] (jailhouse_cmd_cell_create)
>         copy_from_user done
>          > [ =C2=A0130.012960] [wheatfox] (jailhouse_cmd_cell_create)
>         copy_from_user done
>          > [ =C2=A0130.019507] [wheatfox] (jailhouse_cmd_cell_create)
>         cell_id.id <http://cell_id.id> =3D -1
>          > [ =C2=A0130.095151] IRQ 6: no longer affine to CPU2
>          > [ =C2=A0130.095333] CPU2: shutdown
>          > [ =C2=A0130.102251] psci: CPU2 killed (polled 0 ms)
>          > [ =C2=A0130.155283] CPU3: shutdown
>          > [ =C2=A0130.157999] psci: CPU3 killed (polled 0 ms)
>          > [wheatfox] in hypercall, code =3D 1, arg1 =3D 2955416576, arg2=
 =3D 2
>          > [wheatfox] in hypercall, JAILHOUSE_HC_CELL_CREATE
>          > Adding virtual PCI device 00:00.0 to cell "linux-inmate-demo"
>          > Shared memory connection established, peer cells:
>          > =C2=A0"imx8mp"
>          > Adding virtual PCI device 00:01.0 to cell "linux-inmate-demo"
>          > Shared memory connection established, peer cells:
>          > =C2=A0"imx8mp"
>          > [wheatfox] in resume_cpu, cpu_id =3D 2
>          > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
>          > [wheatfox] in resume_cpu, cpu_id =3D 3
>          > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
>          > Created cell "linux-inmate-demo"
>          > Page pool usage after cell creation: mem 82/992, remap
>         144/131072
>          > [wheatfox] in resume_cpu, cpu_id =3D 0
>          > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
>          > [ =C2=A0130.231800] [wheatfox] (jailhouse_cmd_cell_create) Cre=
ated
>         cell
>          > "linux-inmate-demo"
>          > [wheatfox|python] cell created,
>          >
>         name=3Db'linux-inmate-demo\x00\x00\x00\x00\x00\x00\x00\x00\x00\x0=
0\x00\x00\x00\x00\x00'
>          > [wheatf[ =C2=A0130.249264] [wheatfox] (jailhouse_ioctl)
>         ioctl=3D0x40300003
>          > arg=3D281474720245360
>          > ox|python] trying to load linux_l[ =C2=A0130.257905] [wheatfox=
]
>          > (jailhouse_ioctl) JAILHOUSE_CELL_LOAD
>          > oader.bin into cell, addr=3D0x0
>          > [ =C2=A0130.266684] [wheatfox] (jailhouse_cmd_cell_load) start
>          > [ =C2=A0130.274322] [wheatfox] (jailhouse_cmd_cell_load)
>          > cell_management_prologue(&cell_load.cell_id, &cell) done
>          > [wheatfox] in hypercall, code =3D 3, arg1 =3D 1, arg2 =3D
>         4308871775073466112
>          > [wheatfox] in hypercall, JAILHOUSE_HC_CELL_SET_LOADABLE
>          > [wheatfox] in cell_set_loadable, id =3D 1
>          > [wheatfox] cell_management_prologue finished
>          > [wheatfox] in resume_cpu, cpu_id =3D 2
>          > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
>          > [wheatfox] in resume_cpu, cpu_id =3D 3
>          > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
>          > [wheatfox] finished arch_park_cpu
>          > [wheatfox] cell->loadable =3D 0
>          > [wheatfox] not jumped to out_resume
>          > Cell "linux-inmate-demo" can be loaded
>          > [wheatfox] in out_resume
>          > [wheatfox] in resume_cpu, cpu_id =3D 1
>          > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
>          > [ =C2=A0130.342417] [wheatfox] (jailhouse_cmd_cell_load)
>          > jailhouse_call_arg1(JAILHOUSE_HC_CELL_SET_LOADABLE, cell->id)
>         done
>          > [ =C2=A0130.353079] [wheatfox] (jailhouse_cmd_cell_load)
>          > cell_load.num_preload_images =3D 1
>          > [ =C2=A0130.360584] [wheatfox] (jailhouse_cmd_cell_load)
>         load_image(cell,
>          > image) start, n =3D 1
>          > [ =C2=A0130.368444] [wheatfox] (load_image) start
>          > [ =C2=A0130.372468] [wheatfox] (load_image) copy_from_user don=
e
>          > [ =C2=A0130.377712] [wheatfox] (load_image) image.size =3D 34b=
0
>          > [ =C2=A0130.382776] [wheatfox] (load_image) found suitable mem=
ory
>         region,
>          > mem->virt_start =3D 0, mem->size =3D 10000
>          > [ =C2=A0130.392280] [wheatfox] (load_image) image load mem reg=
ion
>         found
>          > [ =C2=A0130.398228] [wheatfox] (load_image) phys_start =3D fdb=
00000
>          > [ =C2=A0130.403653] [wheatfox] (load_image) page_offs =3D 0
>          > [ =C2=A0130.408373] [wheatfox] (load_image) image_mem =3D
>         0000000079dd6ce3
>          > [ =C2=A0130.414405] [wheatfox] (load_image) copy_from_user par=
ams:
>          > [ =C2=A0130.419905] [wheatfox] (load_image) to =3D 0000000079d=
d6ce3
>          > [ =C2=A0130.425329] [wheatfox] (load_image) from =3D 00000000c=
239ec71
>          > [ =C2=A0130.430915] [wheatfox] (load_image) n =3D 34b0
>          > [ =C2=A0130.435220] [wheatfox] (load_image) copy_from_user sta=
rt
>          > [ =C2=A0130.440563] [wheatfox] (load_image) copy_from_user don=
e
>          > [ =C2=A0130.445822] [wheatfox] (load_image) flush_icache_range=
 done
>          > [ =C2=A0130.451429] [wheatfox] (jailhouse_cmd_cell_load)
>         load_image(cell,
>          > image) done, n =3D 1
>          > [ =C2=A0130.459186] [wheatfox] (jailhouse_cmd_cell_load)
>         unlock_out done,
>          > exiting jailhouse_cmd_cell_load
>          > [wheatfox|python] linux_loader.bin loaded
>          > [wheatfox|python] trying to load kernel into cell,
>         addr=3D0xc0280000
>          > [ =C2=A0130.500262] [wheatfox] (jailhouse_ioctl) ioctl=3D0x403=
00003
>          > arg=3D281474720245360
>          > [ =C2=A0130.507454] [wheatfox] (jailhouse_ioctl) JAILHOUSE_CEL=
L_LOAD
>          > [ =C2=A0130.513165] [wheatfox] (jailhouse_cmd_cell_load) start
>          > [ =C2=A0130.518321] [wheatfox] (jailhouse_cmd_cell_load)
>          > cell_management_prologue(&cell_load.cell_id, &cell) done
>          > [wheatfox] in hypercall, code =3D 3, arg1 =3D 1, arg2 =3D
>         4308871775073466112
>          > [wheatfox] in hypercall, JAILHOUSE_HC_CELL_SET_LOADABLE
>          > [wheatfox] in cell_set_loadable, id =3D 1
>          > [wheatfox] cell_management_prologue finished
>          > [wheatfox] in resume_cpu, cpu_id =3D 2
>          > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
>          > [wheatfox] in resume_cpu, cpu_id =3D 3
>          > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
>          > [wheatfox] finished arch_park_cpu
>          > [wheatfox] cell->loadable =3D 1
>          > [wheatfox] in out_resume
>          > [wheatfox] in resume_cpu, cpu_id =3D 1
>          > [wheatfox] in resume_cpu, target_data->cpu_suspended =3D 1
>          > [ =C2=A0130.579626] [wheatfox] (jailhouse_cmd_cell_load)
>          > jailhouse_call_arg1(JAILHOUSE_HC_CELL_SET_LOADABLE, cell->id)
>         done
>          > [ =C2=A0130.590182] [wheatfox] (jailhouse_cmd_cell_load)
>          > cell_load.num_preload_images =3D 1
>          > [ =C2=A0130.597678] [wheatfox] (jailhouse_cmd_cell_load)
>         load_image(cell,
>          > image) start, n =3D 1
>          > [ =C2=A0130.605532] [wheatfox] (load_image) start
>          > [ =C2=A0130.609557] [wheatfox] (load_image) copy_from_user don=
e
>          > [ =C2=A0130.614795] [wheatfox] (load_image) image.size =3D 1ab=
7200
>          > [ =C2=A0130.620131] [wheatfox] (load_image) found suitable mem=
ory
>         region,
>          > mem->virt_start =3D c0000000, mem->size =3D 3d700000
>          > [ =C2=A0130.630505] [wheatfox] (load_image) image load mem reg=
ion
>         found
>          > [ =C2=A0130.636699] [wheatfox] (load_image) phys_start =3D c02=
80000
>          > [ =C2=A0130.642128] [wheatfox] (load_image) page_offs =3D 0
>          > [ =C2=A0130.646853] [wheatfox] (load_image) image_mem =3D
>         000000007135b443
>          > [ =C2=A0130.652883] [wheatfox] (load_image) copy_from_user par=
ams:
>          > [ =C2=A0130.658387] [wheatfox] (load_image) to =3D 00000000713=
5b443
>          > [ =C2=A0130.663808] [wheatfox] (load_image) from =3D 00000000e=
bdde5d4
>          > [ =C2=A0130.669399] [wheatfox] (load_image) n =3D 1ab7200
>          > [ =C2=A0130.673952] [wheatfox] (load_image) copy_from_user sta=
rt
>          >
>          > then nothing happens after this 'copy_from_user start`, the
>         source code is:
>          > printk("[wheatfox] (load_image) copy_from_user start\n");
>          > if (copy_from_user(image_mem + page_offs,
>          > (void __user *)(unsigned long)image.source_address,
>          > image.size))
>          > err =3D -EFAULT;
>          > printk("[wheatfox] (load_image) copy_from_user done\n");
>          >
>          >
>          > --
>          > You received this message because you are subscribed to the
>         Google
>          > Groups "Jailhouse" group.
>          > To unsubscribe from this group and stop receiving emails from
>         it, send
>          > an email to jailhouse-de...@googlegroups.com
>          > <mailto:jailhouse-de...@googlegroups.com>.
>          > To view this discussion on the web visit
>          >
>         https://groups.google.com/d/msgid/jailhouse-dev/f81eedab-debe-4d1=
9-954a-06b55f2fa4a9n%40googlegroups.com <https://groups.google.com/d/msgid/=
jailhouse-dev/f81eedab-debe-4d19-954a-06b55f2fa4a9n%40googlegroups.com> <ht=
tps://groups.google.com/d/msgid/jailhouse-dev/f81eedab-debe-4d19-954a-06b55=
f2fa4a9n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter <https:/=
/groups.google.com/d/msgid/jailhouse-dev/f81eedab-debe-4d19-954a-06b55f2fa4=
a9n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>.
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/91a64cf9-a3b4-419b-b030-f=
c3d295e577en%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/91a64cf9-a3b4-419b-b030-fc3d295e577en%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/cfa0c6a3-854f-4619-8e60-384823fb634e%40oth-regensburg.de.
