Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBS7PQHVAKGQEHF75SOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 121187AED4
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jul 2019 19:01:00 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id x2sf32084280wru.22
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jul 2019 10:01:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564506059; cv=pass;
        d=google.com; s=arc-20160816;
        b=fk2W9Jh4cn76+BZHDp1dYka8IAOLhhW8Gc1D/XEqUFf6gcHrLuymh4MPhD7ZJrSxBY
         8taU+6Ha+7rSBUl6HMrUx3ZnklNK3+MPDj4mwVVY8LD9F7OlTCmzoYQdih5AjJcDL4y3
         GG/0ZBQ9V4zx71XOOFhTW+EkDimpesdlKwL3/p6RpIRtNscANCyUYGCNLRrTSrJogBTi
         K5LPr8bsxMw99mkpT4+gxDY7/JczQrXnSsAP8DkHZKzBBFlgv5bNaGXjZwCKd5/ZpOOC
         KHJGmFxqpD3Bj2fq9i6crcaw47q9+bKcq6h3iucdKbK5M/6meKbbRdIwVXZirovDHGeF
         XaCw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=kSd4ttH3qMjfSSEmafmH/IhC9QVofGgs/f8MnBF/XYY=;
        b=oEBqOwq7ppzcEP9f4GYHSBSOSDgx1Kph+s4ELtBgQ4Wp8WqMzxJNG3G0KlZRa9ZnDo
         6N/HKaZHinkou4UbDQ7WwY0A7bv7huiE/5sIR3dfx7lqFiCPxRhTcl3nyjgj4rneED8z
         mZtVA3UPgBRUedJtirp9JeJ5i4Ox96kiI7HifCuB25Y0bH/bHk8CPMFCFPApmF+FUVl3
         mfspgvBrDhNIbrvOz0jAqNp7nNPtUihhdAu0K0rDu3oFzB3bqQH4US0fptiZoJqKgmvI
         6BtvHLnPezFUW96vPXRWdVnrPI5bDghUP1o90TqdrhA2h5pz8MNjpHjOl/wnKXCgQlcl
         UFZg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kSd4ttH3qMjfSSEmafmH/IhC9QVofGgs/f8MnBF/XYY=;
        b=nqG0K4gjbx6ESLEUYVvVV6DrsSosSA5InwLLUTyq+AhzCRsuNsmrq4UN9sQn7AlBuV
         ALwL1QWuBy4sZK5H9Dmth5FHBAb3Tmr2Xcjlm0LcThbYzEXomdIjdmtCv8hFX422f+UZ
         09nmU+wRYBpcgF81I9iapfK6iuHXDNNfg9abV1DBkHUtnikNCcoXk/5yvpUIOJGMQpDj
         GC046btQsYeHoSInSg7spKwo7TOkhFHSmHnnxNerkWGdEgWfBl0yDvRXpKl3tJpx01E4
         YVPJjwdhvBQWJFijeK4SFcJZhZro3NGVwPF+4cAzsqngEqnRX51ByVpi3PysnR/OsOyT
         wwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kSd4ttH3qMjfSSEmafmH/IhC9QVofGgs/f8MnBF/XYY=;
        b=c79GycXiQOux9Y6lPCA2R5PmoyIv/GV/8zMddQG8PiaTQ9XuXd/vm4d13TJz3mIel4
         AFjvv0lCX6BMhaS/TNp1gMsHvVreDFajvhkt9Wo8Ta1pTq2Ux5t/huln+mhDqOjWeQZy
         l9b4E/d3N5soFOkEFCiIIC+tlFukKtzSxo1x80+89K4ZYPEUSAceXbtR73B6H5MWrku8
         k1vXG5tkgXciSZl5lMVrfKtvTmeVhiZC3qY5ASRYsiG3tyFQe1HM17cRZYVGA094SgZV
         JSPI92U0+K0V3NHPcVy0s2HbYZRbh/G5nBUS/k1OuAASkQkoRqQu5usMEgCsTA6fXJ87
         sKFw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX5RrGL2rSgDNi+DZ1ErsAB0n3YfXyOl5fRl+D2jRFSpPZZX9hs
	SjntTBsmw05iE63jlQQnMoo=
X-Google-Smtp-Source: APXvYqxcmjxwi2se7nvhB9JCvVdZFATM0pGJy9+6OMJxLat8HGuuQqiBipHN08OXIAQefH5AiYnKNw==
X-Received: by 2002:a7b:cbcb:: with SMTP id n11mr102627882wmi.54.1564506059736;
        Tue, 30 Jul 2019 10:00:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:9083:: with SMTP id i3ls19604309wri.14.gmail; Tue, 30
 Jul 2019 10:00:58 -0700 (PDT)
X-Received: by 2002:a5d:564e:: with SMTP id j14mr125400464wrw.1.1564506058889;
        Tue, 30 Jul 2019 10:00:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564506058; cv=none;
        d=google.com; s=arc-20160816;
        b=T9xHJKlXALpyJJ7vWr/Wkh/TzT/fwAdxJsaMWojGYmqdZGqTn3XdLhLuadg18kuwFE
         QBVC+/O3Ap/KKOSMDdO15ojUwQD4iA/b843CKkKCLybQ+xTf7KWhQK08QUMXyKQbjHF9
         sBN08c3j1PRLuklZTwDQkGEBTwDcRYbfm4Op1gFxmfO5oo7TdJyNORr5WF4sA0SHcLKb
         p1lVrq7ZDFdcLp7+V7rHrn+T4v4qQzhQ4EM5yWjIkdpD+o0NL1urxwBuicKEmDcCpaMp
         KLZ56ydtbvGjia3OtrpuCxGJjHfrvZxHBAIWGkoDcDp1g23hriIYhxNiYLNqVELjxHKo
         3kbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=D7Rz+/HPcH026CWxh5Lbd3KILgYMuq/GmuRr7KPXgqg=;
        b=xrnoFvQTnJ4ocxrYMdFPaE8DAPtzMzcv2OTAgaMp5XPby0G/qE6JlhiJ9ZlKviT0sL
         x96LPJ7Sj04JxXlvTO4b3fcUW6S0m9Y9C8lHCoHcAtI8wz/2HrmPFcwhs1tqdU9VQU5Y
         a5IvZ6X9Ttr/LShsFrvzzxJvF0cb6VX1Mem2JBJsbNAgrlL83BhKAL6zEgRMs2d9dTJF
         4krtV6mbJZwbjeZeW10InhpKCXKjqsPtHU2TmiwoI/ij5wGOcz17QGgAvrGropRHNivV
         aDAjK+koZIuP6aqRyong7BWk8hvvX904MVn2fVE4CbJhdD6e13qL9ZfOcO44gEMhrU1s
         itlg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id f13si3727570wmc.3.2019.07.30.10.00.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jul 2019 10:00:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x6UH0vhk016006
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Jul 2019 19:00:58 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6UH0vab020090;
	Tue, 30 Jul 2019 19:00:57 +0200
Subject: Re: Colored Linux as inmate
To: =?UTF-8?Q?Jo=c3=a3o_Reis?= <jpagsreis@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <fe00f482-c82c-4f93-8a0e-f73dc955888d@googlegroups.com>
 <b4e7dbee-58cd-3126-ce6b-7b54ee0ef241@siemens.com>
 <211205da-9e38-4178-895a-3ba80f214aa9@googlegroups.com>
 <6abaf77f-e4a7-7a9a-2ae9-8d1d8f1388bf@siemens.com>
 <1726f6bd-680a-46ac-a7f3-937cbba84208@googlegroups.com>
 <19e76b74-6d6e-010d-952a-5a36e606091b@web.de>
 <a5b27da1-b2aa-4ce0-863f-d9503a22b886@googlegroups.com>
 <885b4c3e-8d69-e516-aff4-46f2e50cb622@web.de>
 <edf7dab3-2c32-43bb-b13b-fce8bc452418@googlegroups.com>
 <4f76dc91-7542-40b8-a0d9-eea52e1dd92a@siemens.com>
 <e5c36ed1-98a5-4a76-aca0-6589cf9c3108@googlegroups.com>
 <ef7a124c-e5e3-f61b-8ed0-aebf585c65d6@siemens.com>
 <dde1cd0e-407e-45b3-ae32-97c445100824@googlegroups.com>
 <2f6c0983-78e1-73e0-183c-3983dd757ee8@siemens.com>
 <39b83770-5562-437f-a25b-415d85dc7c3b@googlegroups.com>
 <94e3009c-aa34-e8f1-b503-d3a8b138d9a9@siemens.com>
 <43d8fdde-153f-40ec-8974-4388efab8315@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <c30da773-76bd-3691-3828-e8f7ed592d52@siemens.com>
Date: Tue, 30 Jul 2019 19:00:57 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <43d8fdde-153f-40ec-8974-4388efab8315@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 30.07.19 17:54, Jo=C3=A3o Reis wrote:
> Ok, so i realized i was declaring, on non root cell,=C2=A0a memory region=
 that
> belonged to non-reserved memory from root cell(3fd00000-5fffffff : System=
 RAM).
> I've changed the memory region to reserved memory (address 0x90000000), b=
ecause
> on u-boot the memory reservation argument is mem=3D1536M, which equals to=
 top
> address 0x5fffffff.
>=20
> /* RAM */ {
> .phys_start =3D 0x90000000,
> .virt_start =3D 0x90000000,
> .size =3D 0x20000000,=C2=A0
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |
> JAILHOUSE_MEM_DMA,
> },

Do you also still have a small region at guest virtual address 0, to put th=
e
loader there?

>=20
> After issuing "jailhouse cell linux ultra96-linux-demo2.cell Image -d
> inmate-zynqmp.dtb -i rootfs.cpio -c "console=3DttyS0, 115200" -k 4"
>=20
> The following error appears:
>=20
> [=C2=A0 =C2=A082.987144] Created Jailhouse cell "non-root"
> Cell "non-root" can be loaded
>=20
> Traceback (most recent call last):
> =C2=A0 File "/usr/local/libexec/jailhouse/jailhouse-cell-linux", line 826=
, in <module>
> =C2=A0 =C2=A0 cell.load(open(linux_loader, mode=3D'rb').read(), arch.load=
er_address())
> =C2=A0 File "/usr/local/lib/python2.7/dist-packages/pyjailhouse/cell.py",=
 line 44, in
> load
> =C2=A0 =C2=A0 fcntl.ioctl(self.dev, self.JAILHOUSE_CELL_LOAD, load)
> IOError: [Errno 22] Invalid argument

Does the hypervisor report that "Cell "XXX" can be loaded"? Then the error =
is
reported by the driver module, load_image(). And I would bet on a missing r=
egion
at address 0.

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
jailhouse-dev/c30da773-76bd-3691-3828-e8f7ed592d52%40siemens.com.
