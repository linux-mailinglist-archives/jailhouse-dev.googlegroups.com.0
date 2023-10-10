Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBYWYS2UQMGQE7BYACRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103f.google.com (mail-pj1-x103f.google.com [IPv6:2607:f8b0:4864:20::103f])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC3B7C406F
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Oct 2023 21:56:21 +0200 (CEST)
Received: by mail-pj1-x103f.google.com with SMTP id 98e67ed59e1d1-27731a63481sf5916986a91.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Oct 2023 12:56:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1696967779; cv=pass;
        d=google.com; s=arc-20160816;
        b=YE+f9JvqyCO4AUxUsnIlJ9K3jC+0Xkwu0H5HuiwX4U/4uSakl7K19SWmiDYFFDVTBJ
         +ytMdqPiLVYtrHxFtMP5DljtvIzrgXFYlZo8cwQ9TIkBvzVoMl5NXciy0rCbcq0X8t6q
         Od7wHIVcRlhURdbfXqtBnTUwhTzle41pZ6a214FWPAjbXFSH4QSmHvOO/Tq/JMCnZBkR
         ZTOuGClA69DLNXX15+yRA4KS4XzuY3a7+TP+0Gadrchfp6Zi+91fawR1uvU8pdHZ5rQX
         dtgO0hi7JkEkfV3y5q8HBPwPKkMKdz3XiorDzly9PIQevo9CwycAW8Rdr6qdK/sTfm1r
         Q7FA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=lAvgizz/BkJyTc1ruWdnGIENNpyCE9EidnLB1zNX/Ds=;
        fh=Bb0Mh6WM5GOyghlPxItbdpGI8w0Z16ZBFlUvvS2mCjY=;
        b=C3n2tUZyMtSCI6gW+of1srdotgPrq7a+FzpQcxuWvzjscy9HdzPMJxuRbvFNb2v0e0
         1JAdMhNVIbopgD9ZgKudssTgbYYJpYKlMrBJ0Nqnz55sIJhiTmG5uAAdraDB23jGvTgW
         9HxOTpsBh1e90B4lVXKIvzCI7VYk6Bw9lrgsr+4mjOnRHB2uI1aj1/A83ucfvJQWMBSK
         52gekahQ+bV/FjQGbLFedbf24FO56hq/8fgtmKjdENtBcyXrr5EdgjIsLnZ9soRUqWoH
         5/JpsrF6W7jdYqYcMWnMSPgr5u7J/U25PKhM45WH2fz6HX9RdNMclLs/KHzSN7Vy0k0M
         ZxUA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=sDFKR3Au;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c303:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1696967779; x=1697572579; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=lAvgizz/BkJyTc1ruWdnGIENNpyCE9EidnLB1zNX/Ds=;
        b=cK2glFtQzcfec6RLwzIwgu7cE4ybPztQ2H+EPKX6f5PUUjHetBOPk3eriDdoY9Cskr
         mqWrAeVwCcLoT/ogHVpbuwi/eMvfpvpH3GdS0CPrHrcGHB66OIG1t4+v7dCioTwuTYGe
         STkxu9RkkhZn7ahw4R0cmagdcgYqGZyon747xUSIbzsNTJj6SHOxLEL/ukxIJJ202sG+
         qMIyczR+OpnCx7LozbIc7SdEYE8VjLLnQXgcskfrGYt+d7Awevk3Rvyf5FoU4QAnc7ZZ
         Zc3UDVJuzaK6PpGJTe3XtQsKek2hCUdtdD+Yws2G1sSLnnH+Lpmxm9nMJnywwrac3PPf
         Bolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696967779; x=1697572579;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lAvgizz/BkJyTc1ruWdnGIENNpyCE9EidnLB1zNX/Ds=;
        b=oO2F0Aflbsjm6dVmEhEH0AyCjN+XDOZ06jM547evvicbq3mRjQLJCPMXxkXKYd6qB4
         Rp29CQ1eQ2VzPCCvsFR1vFyj8Xeq6z3bZrhRfX7FwdfdgkT5fFQyLsoDX0RGHuUf64hv
         PkCBzA6parsfBxmkHvouI3u4u9wpIDsCAjkFmty2YpTeL1h3wMpO1MbuB0kaEms9BsRC
         oVf0Pa2SCjMxJFMyc9VU/4cAikfdLhzXHUTiauL92JjaxQs0SnmY96RJ+MMzrJLySz4N
         +nM80AXUszNozjVmXZIIy2QDBIc7CrUsGITXmx7Grl10ZfafY4lcyOxDHQjSTHut2AZx
         OVbA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YwxQHg/bFNGMpMaLKCYMh0ZAz8k+HTHsd3rnToBiMIzJSPWNG5k
	lfokBjBYCgO1Tcs+ysrGA34=
X-Google-Smtp-Source: AGHT+IEAWHrN+mP+Dtc/Jhfwfp07om8msIgQglr0GYmGP9DE15TuNYdya6AVPODltR4naboFrRBDyw==
X-Received: by 2002:a17:90b:3784:b0:276:ba43:a863 with SMTP id mz4-20020a17090b378400b00276ba43a863mr17641559pjb.41.1696967779268;
        Tue, 10 Oct 2023 12:56:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90b:1943:b0:277:3b93:d44e with SMTP id
 nk3-20020a17090b194300b002773b93d44els3840083pjb.0.-pod-prod-03-us; Tue, 10
 Oct 2023 12:56:17 -0700 (PDT)
X-Received: by 2002:a05:6a20:8e2a:b0:154:a1e4:b676 with SMTP id y42-20020a056a208e2a00b00154a1e4b676mr25107816pzj.4.1696967777578;
        Tue, 10 Oct 2023 12:56:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696967777; cv=none;
        d=google.com; s=arc-20160816;
        b=svX66x4Y1P7KS3JXSteyShCuUdUasX4pUqyuKpAuM6CcVM99XUcyzF5L1SDa1H0fub
         grFcNXQi2CZLChDdNBNG8TK9m6dqUmF3qjeDHFWriNk8z8omZ3Q359jyZ5qPqir3prwD
         47/6jNgL9C48TtO6XTwMyMpKDz0VoaYO8HScma2vVLOqIKXZXmp0Wu3+C0Wr60P6TDQr
         dCp0Sf+r5fIilHAlDuUTFVmwR8k4N+theOX/I6r5pUUgQPfIPJRcFM/3tr51cwvHFjAS
         s1mONFfc6ef5ZzlpX/tR+jtIWo4ukeHKGLeJgFw0xMjH1rx2drlkjqnFDFeZpKIl3Gj3
         Fb9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=o3eCvI1S3rNwLkNiOeIeV9tXyqCCOpL1jNXgQbENG/k=;
        fh=Bb0Mh6WM5GOyghlPxItbdpGI8w0Z16ZBFlUvvS2mCjY=;
        b=sPG5yQXx5hiOq4K3UN7D2IXYh0AdclgiSlFVVuOZNJBybqTELPUvKPEY2jMBRWJ8ph
         2MGfkJiV5EJEzQ8o/C8j1O4d4yp/QXUsja5ILz5YGC0ujw/nJEsyVYb1yvmjXiIvT2AA
         noo8dQGXKzZNrVDOAYb2d94Gy6dYdr9jgIE0+sZLLerH8boWNoRvLfq4MlOf68h3Np5Q
         q53OSK+mbqqu1LgnyWldYxga8DoIp1SSSPbRaCj/N8/PkHr7hCXi+PUxG8vtFzbEu1xv
         FGZpdOJbN8so3nh1bdZP6R0w+hpDref5RSX2RPxHqpGDJtZVD7WHKYZo+0lTxw2d2Mr/
         aQlQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=sDFKR3Au;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c303:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from c2752.mx.srv.dfn.de (c2752.mx.srv.dfn.de. [2001:638:d:c303:acdc:1979:2:f4])
        by gmr-mx.google.com with ESMTPS id ay8-20020a056a00300800b0068e34c6b99csi867650pfb.3.2023.10.10.12.56.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 12:56:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c303:acdc:1979:2:f4 as permitted sender) client-ip=2001:638:d:c303:acdc:1979:2:f4;
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de [194.95.104.12])
	by c2752.mx.srv.dfn.de (Postfix) with ESMTPS id 1138F2A03CF;
	Tue, 10 Oct 2023 21:56:14 +0200 (CEST)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4S4mqd4tTrzxqw;
	Tue, 10 Oct 2023 21:56:13 +0200 (CEST)
Received: from [172.23.3.112] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 10 Oct
 2023 21:56:13 +0200
Message-ID: <3acdd865-1303-4ba1-8c4c-9fc3ca8d2c67@oth-regensburg.de>
Date: Tue, 10 Oct 2023 21:56:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: CPU shows offline - Jailhouse Linux inmate
Content-Language: en-US
To: Bharathiraja Nallathambi <barathiraja@gmail.com>,
	<jailhouse-dev@googlegroups.com>
References: <CAGA=GbzmH9eiuBrKjVeeKf--5fRFVGxwyCe6D20e4MDn66d3tw@mail.gmail.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <CAGA=GbzmH9eiuBrKjVeeKf--5fRFVGxwyCe6D20e4MDn66d3tw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=sDFKR3Au;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:d:c303:acdc:1979:2:f4 as permitted sender)
 smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 10/10/2023 17:17, Bharathiraja Nallathambi wrote:
> Hi,
>=20
> I was trying jailhouse with a linux inmate on an imx8mp-evk board. I=20
> have created a yocto build with jailhouse and linux kernel 6.1.22-rt8=20
> which is having the patches for real time linux.
> Booted the board with running run '/jh_mmcboot/' in the uboot prompt.
>=20
>  =C2=A0Once logged into the device, I have started the jailhouse by=C2=A0=
 running,
>=20
> /cd /usr/share/jailhouse/scripts && ./init_jailhouse_env.sh && cp=20
> /run/media/boot-mmcblk1p1/Image /usr/share/jailhouse/inmates/kernel/ &&=
=20
> ../tools/jailhouse enable ../cells/imx8mp.cell; jailhouse cell list;/
>=20
>  =C2=A0the above command will load the jailhouse.ko and will enable the j=
ailhouse
>=20
> I got the output of 'jailhouse cell list' as,
> /root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# jailhouse cell list
> ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 State=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Assigned=20
> CPUs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Failed C=
PUs
> 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 imx8mp=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 running=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0-3 /
>=20
>  =C2=A0Then I started the linux inmate, the CPU offset in the cell=20
> configuration is 0xc which will assign two cores. I am using the same=20
> host kernal image for the inmate also (6.1.22-rt8). Used the below=20
> command to start the inmate
>=20
> ../tools/jailhouse cell linux ../cells/imx8mp-linux-demo.cell=20
> ../inmates/kernel/Image -d ../inmates/dtb/inmate-imx8mp-evk.dtb -c=20
> "clk_ignore_unused console=3Dttymxc3,115200=20
> earlycon=3Dec_imx6q,0x30890000,115200 root=3D/dev/mmcblk2p2 rootwait rw";=
=20
> jailhouse cell list;
>=20
>  =C2=A0I got the output of 'jailhouse cell list' as,
>=20
> /root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# jailhouse cell list
> ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 State=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Assigned=20
> CPUs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Failed C=
PUs
> 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 imx8mp=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 running=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0-1
> 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 linux-inmate-demo=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 running=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 2-3 /
>=20
>  =C2=A0I could login to the inmate using serial console. But the output o=
f=20
> 'cat /proc/cpuinfo' is showing only one core.
>=20
> /root@imx8mp-lpddr4-evk:~# cat /proc/cpuinfo
> processor=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 0
> BogoMIPS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 16.66
> Features=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : fp asimd evtstrm aes=
 pmull sha1 sha2 crc32 cpuid
> CPU implementer : 0x41
> U architecture: 8
> CPU variant=C2=A0=C2=A0=C2=A0=C2=A0 : 0x0
> CPU part=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 0xd03
> CPU resion=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 4/
>=20
> the 'nproc --all' is giving 2
>=20
>  =C2=A0It looks like 2 cores are assigned to the inmate but one of the co=
re=20
> is offline.
>=20
> /=C2=A0root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# cat=20
> /sys/devices/system/cpu/cpu0/online /
>=20
> /1
> root@imx8mp-lpddr4-evk:/usr/share/jailhouse/scripts# cat=20
> /sys/devices/system/cpu/cpu1/online
> 0/
>=20
>  =C2=A0Am I doing something wrong? How can I turn on both the CPUS for th=
e=20
> inmate.

What does the non-root Linux kernel console output during boot? Are=20
there any error messages that might give you a hint why bringing up=20
secondary CPUs failed?

   Ralf

>=20
> Thanks and Regards,
> Bharathiraja Nallathambi
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/CAGA%3DGbzmH9eiuBrKjVeeKf=
--5fRFVGxwyCe6D20e4MDn66d3tw%40mail.gmail.com <https://groups.google.com/d/=
msgid/jailhouse-dev/CAGA%3DGbzmH9eiuBrKjVeeKf--5fRFVGxwyCe6D20e4MDn66d3tw%4=
0mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/3acdd865-1303-4ba1-8c4c-9fc3ca8d2c67%40oth-regensburg.de.
