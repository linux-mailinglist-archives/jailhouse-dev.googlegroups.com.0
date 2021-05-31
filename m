Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBFGD2SCQMGQENWYJLRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ua1-x93f.google.com (mail-ua1-x93f.google.com [IPv6:2607:f8b0:4864:20::93f])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD2439676B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 31 May 2021 19:49:09 +0200 (CEST)
Received: by mail-ua1-x93f.google.com with SMTP id v20-20020ab076940000b029020b0b4ada34sf6536989uaq.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 31 May 2021 10:49:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1622483348; cv=pass;
        d=google.com; s=arc-20160816;
        b=GnTOLQBCsyn+jh9Qj9slPXjnmAtqaLKV4o+7+6IdUv35UXLiEszcVQOD4K9ZJQnmCr
         9vNRB70iDwbD5O9HsyH9be5ovrHkG+6j03/OjIGTXEYnsWJNG6Hyutz1BuXIsxy2ByQb
         iiAflaaC135sIGzczn4EKncf21CUy39/J0skkZwhRaWrfbwPqEdTTbwZ2LRmkwfOj/Jd
         Js4n4ed0mVcXzjgiKi+YJ1EGyR3tzpCb95v2RrIqp63n8q9ulNjsFOcsphQXC8wwCdge
         IDLLrEHRg+6YuXJ5gWq+OflcXvPy8wVNPdD69KKoOjzTdBjPuYnQCpYnS8fcqdyTkMgE
         d1Ug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=eXIKLYigsFgtuxpuP+Ve7ncDSnrniaoGwzyN3HjH2yM=;
        b=jzH6+ngTld9ZTkj81S3LHYz0u0IqGYvBevd9PzghJYbcklL1zS3EsAM/ndAMFgkrZ7
         tYyqGhPm7yXdFDcpSQViSKg8uF2v1CpC2rvkWiwSC7zYBPvI+C2cKkdloGpdnUBJrjDa
         a3EIQ/IvVv8vy5/9U6w8Mcmm7rD8FKm3mzh/AvYHYhUEhRPThVmibhaL1fdsRP7TwHRa
         DTQPl2MquPvkhi+W46nPzi5u7z9optMfi0QzzpcwUW1EEc/S1eL2pLEVnaSfWkEVln0M
         wu3WebJ9p+Tuq1zsIvwoDaaMNIGRJGFhjmyeqsuhdEgskP4iW1W2kMBFBmg0yoJt5M8z
         JvZA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eXIKLYigsFgtuxpuP+Ve7ncDSnrniaoGwzyN3HjH2yM=;
        b=HvgFDIqJ3HAvIoUXaxaBIfq1e0y13jhxnYv8IpBec3Q125U8Hw2zLf50De4iOswS1j
         kzvoM3VhJHEtcCYqDhSVCYwRlMJaDiPp6PynUtFaVK03n3fyqWHqpAEHrCBVTkqSL57U
         8D9EgDZ5Ujav6JP5Iw1v6PskRDNGX8I4gZ+u9tfru3B6HqF9IobGzaNzsDK6jOB1iVrB
         YJvMnP8VGkWGr+EgX7q702AhzdZlqu8TNWp3SuRIwvWtk9ijtDVp9h3lCt6oRD/E8DUg
         Rmt25w2iZQxK4z9aw5FVx8LBbrD45Uc/9Mfc1N8EcOmulj56t5M7fE3+b5C7WRPKtKtE
         oNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eXIKLYigsFgtuxpuP+Ve7ncDSnrniaoGwzyN3HjH2yM=;
        b=RAgts3mFUjxCNkk66aNkRFjRD3QpN2t8YAfQG54wRpYPJQR+i3/z7hPz6jsIXlupVL
         lYVzcdegbwOZbYF5CEb4ATX1xp9tqgQhTrsYdX5RQHnu3dvbLjvmV6qRYGU5FDqLrfhk
         DweP0/RuLXhsXtQQA6XHLNRo8M8DbBLmJd2SQb4FAoQPfoceC+jzZsxyj9ryJXZBEFnj
         TEd7M25EsJEe1YQ2/mpXLOrZ6B3EN6dMSATc0fyXngtKORo7o7QE1n0nPt0W5/5DMlEq
         dGwJR3+lsvCgMaeOC7lhYT3+9jnVRFPyMrsPxkkU8n0bdVWUE2Xxs35HfazpU4swxbNb
         h8iA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53360hUw3AV6mv2Bj6wzrwsYvVp/4mEvxgdyDLShKd6c83DI+Xgv
	+Ntgl8LBLfa3vyf9uKyISuI=
X-Google-Smtp-Source: ABdhPJzT48vQtFn11nj2cDaoGk3xAomqa2fhvnrqnHyhdzcLA1jsH6t1C44zVW0xYf2vaPFx5oDOpQ==
X-Received: by 2002:a05:6102:2330:: with SMTP id b16mr2576543vsa.4.1622483348549;
        Mon, 31 May 2021 10:49:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ab0:1c52:: with SMTP id o18ls1313674uaj.1.gmail; Mon, 31 May
 2021 10:49:07 -0700 (PDT)
X-Received: by 2002:ab0:185a:: with SMTP id j26mr4808498uag.33.1622483347888;
        Mon, 31 May 2021 10:49:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622483347; cv=none;
        d=google.com; s=arc-20160816;
        b=mJSM4VISFmIFcRTOE93MELb/PGf2c6GZdIMSS1DxuQiKihiiTR6t2ML59snyy7Dx5+
         U49GqrCKu/eEDWLDP+VxiJM7rqEnBd4wl0mndJ2K1GfpyIB42+7TCIM2XzrnTp6nS+le
         YpKB255ARBjk88XT50hnx6u+Dmp7wDxWECnxgO5kA3qJvHa0byjxspV64V791cuoJDV1
         7OlP7OPt5UloAKktO2+TFJt44ku/qooONuVRHV5I0UOXz6MS7g+Qy8rM7t1SMqCjp9Tb
         N7yBL12Qrv7jEfOyfoKxIGnLrwTkgG5ybahW8yjtkEobQ3/5DwmY3CnWuF2oyr+3oqHr
         huFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=vl79zf4NW59NaRZGFeK5W9X40tIBnAaqWrLJubnqnH8=;
        b=np+UZ8nboT8DrZOs/wcyte1xd51ostOm8cUivWfNqCmxsqJmcMCaeFSgEdWZO0yJgO
         WSw+W2BtVYy88nLMNSe/MFqurlaGWxi7GmR6lPqNTknRwe1IVWr7AB71l1b9jgKs3uaZ
         rJYeofmQMDGMmtejVbhzNe594amtcbkkhuvhAbZO5ToQQID1MY4ISSQ8M13Pt5KY8hoN
         3dvK//bd+dUXp2aYlxMDAD0HUEcwQU1iESn3eI1EFJCcR/dDt/gJu4kSxRWUnAPSB79S
         FkxwSb1MO+KXHUrCWmci1TadbGnOpb5Nf/ZGaZQJv0nYO+RPc61Bv2jVa1fyK3Su+WqB
         x2bg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id p201si986953vke.1.2021.05.31.10.49.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 May 2021 10:49:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 14VHn3b9029685
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 May 2021 19:49:03 +0200
Received: from [167.87.247.112] ([167.87.247.112])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14VHjLqu008447;
	Mon, 31 May 2021 19:45:21 +0200
Subject: Re: The right configuration to partition pci device into inmate for
 QEMU
To: along li <v6543210@gmail.com>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <31493abc-ae9a-42d9-996c-edf630f2456dn@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <a829b501-b59d-d9f6-531b-6ad07667d2a7@siemens.com>
Date: Mon, 31 May 2021 19:45:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <31493abc-ae9a-42d9-996c-edf630f2456dn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 31.05.21 07:00, along li wrote:
> When I run=C2=A0 qemu demo. try to partition pci device into inmate.
> I failed.
>=20
> After some lone time trying , I sucess.
> The PCI device=C2=A0=C2=A0e1000e=C2=A0 is partitioned into inmate and pin=
g sucess in
> inmate.
> what the defference is:
> 1. I=C2=A0 add this into root.c(qemu-x86.c) and=C2=A0 qemu-linux-demo.c
> {
> .phys_start =3D 0xb0000000,//mmconfig
> .virt_start =3D 0xb0000000,
> .size =3D 0x10000000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> },

This is wrong, "jailhouse config check" should also complain. You will
eventually loose interrupts or get even worse behaviour.

> or It will show=C2=A0 =C2=A0"Invalid PCI MMCONFIG write, device 02:00:0, =
reg:110,
> size:4"
>=20

You need to address the root cause: The guest tries to access a PCI
config registers, likely related to PCI capability that has no write
permission in your config yet. See also the good-old Jailhouse tutorial.

>=20
> 2. use qemu-6.0 to run the qemu demo.
> When use qemu -2..11.1 to run the demo the network=C2=A0 card cann't run =
sucess.
> It=C2=A0 turns off=C2=A0 after I=C2=A0turn=C2=A0 on it use=C2=A0 ifconfig=
=C2=A0 up=C2=A0 command.
>=20
> well, may it help someone.=C2=A0 whe to try the qemu demo for pci partiti=
on.
>=20

I'm on 4.2.1 to 6.0 here, those seem to have no issue with changing
resource layout. Possibly, we have to lift the lower version boundary by
now, though.

Can you be more specific in regards to what didn't work? Did you try to
compare if /proc/iomem in the root cell is comparable across those qemu
versions?

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a829b501-b59d-d9f6-531b-6ad07667d2a7%40siemens.com.
