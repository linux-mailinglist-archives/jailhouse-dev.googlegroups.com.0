Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4GA57WQKGQEKWFIPZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 20574EBE7D
	for <lists+jailhouse-dev@lfdr.de>; Fri,  1 Nov 2019 08:36:17 +0100 (CET)
Received: by mail-wr1-x439.google.com with SMTP id f16sf4689918wrr.16
        for <lists+jailhouse-dev@lfdr.de>; Fri, 01 Nov 2019 00:36:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1572593776; cv=pass;
        d=google.com; s=arc-20160816;
        b=I+QBHU5+Xo4DUboQ6uYzNUbFbsb+eA3iPhxSQwCywzlhkfTV8HtzldoJroKZmXZDtk
         Zj3tQAMMX2hgGl/E1M3SVdDhAviVePGSTfQr722VOloQvR+MK54ybEHNPbk63aUA6XUV
         Clc0HCYpYfcBFStSFAB7WUIYAWqxyfVnNRZGH36sp1iaS3GI5i6HL9oJCCGAsKuCuNdG
         C8AqRpsQrtEM6NCpaAI61jBtvL9MUsL6kJcdpLSgQ3tyRY4OvK3JZsVDItFOu29Cv6YE
         0QIFN9VmM9zLx4oI+MyuspS5XfN78hWLDi9qn1uJwLmt7XLq4wOZxakYI+kQqL6ldQP1
         1wEA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=6e1vrRASidWHQxDnqUtCGp8Zpt4cjUamipnXZpSZYxk=;
        b=c0N7Lyl2jPAaJ2q9B5l3iqg4ZPZkPlD7KvTtZX+cEC1rtbPEyYjNMrUveZqJYsZ5F3
         4Ux7UfJhvynNDA23aTHbh80gzqRy3Xmw8DbFfXt4WJsDFHfbqvqt2DCsXctJOUtpHn2b
         CvP1t1F94RW1cTxYOEmN6R7yhrgK+TsCagLEjRrQRmBxYI5ZryPgJ9WLjhuE0g0DV0D1
         7woy3OZuR675uM6OonbYdBGVoF8ZgQRo3Svg9LB8FiSiAl+UliEk0jKuZ4B12kbaAxPG
         qjUbxOFWHIqQMmdMxjtAdWI3ODNC3G6Dq5T92LEYyD9vSd0ybgscCajMIZhPBG1kSo6Z
         kDvg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6e1vrRASidWHQxDnqUtCGp8Zpt4cjUamipnXZpSZYxk=;
        b=VGJ/D3jol7v8+YtHk3goJAZ4k/kNsdSRUnTrlhorxkQn4KM/A9onEdjPr9rZxvKyxL
         u+3qBxZlqzyuIf3EiUB1qwEv2QxutxlAnsEWzMlPljcEd6mwASnmn5OPjIkelni5ZISt
         68IYAsPJFQ5vAjmcpKZmMJJjbKLXGou5sDfTvtZ6NzpGEAkP5T41ibtTeSifNFeamULP
         LHjRPsET/UVWKdZR2bTtb6SG9ckZD3PhmLwJPLErQ/XgtyTQsb2mMQEQFjEAROPk3lB8
         xs9bNYtkzNE1X4WLQTCCtmqJsTULHCzs3lFFMFEXdObcbvV9TL8Z0Gb3+QD0dj2PBa7F
         Efvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6e1vrRASidWHQxDnqUtCGp8Zpt4cjUamipnXZpSZYxk=;
        b=FcsKoRfl3GTmkeZmSdxfadyLStW+PfnYjITRkrXzf+SHjgX9TPparlcY7IQWGY+Cgx
         XRxwwBx4ti9hIvsR5nRUty5LFSzc7CEQ6dZ71b+iGn4Mn8saeixHq26i8yNcg7osrOLH
         oYLWosgbnG64iL3V+xSL2ymdANetY1X244Sb2NiZByBl/wqXmsGpZ3oh2eEAMclxSK0X
         1pbkKuxEQjFumbEV1KZAxMSSGFNicobB7X7nMnVTf/yJMya9DYNycCEUdVmgnyL6tySe
         3GFtlWW2G7IzdpZeHQqFtC+c/V+r6MvxR3VVBEQVe9JdDwESIg2X1QDgq+tzGbgPDUzK
         b5Dw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXijNTwirS1VbnTfuv9UtazbqKr8RWFFmalzu3fib+zn10eyIQ8
	OYOaWRYXIAFn/nTjm967Y08=
X-Google-Smtp-Source: APXvYqzvG70DJDsJXZr7HXSJeR8QbbWErUhQTO5EqD9upTZPVZqh6zdlZ6k3IPZCVQbgFqVi5yEX5w==
X-Received: by 2002:a5d:630b:: with SMTP id i11mr8885228wru.87.1572593776668;
        Fri, 01 Nov 2019 00:36:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f74c:: with SMTP id z12ls3511599wrp.10.gmail; Fri, 01
 Nov 2019 00:36:15 -0700 (PDT)
X-Received: by 2002:adf:b1c6:: with SMTP id r6mr9843142wra.48.1572593775740;
        Fri, 01 Nov 2019 00:36:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572593775; cv=none;
        d=google.com; s=arc-20160816;
        b=C/RwZkA72nly+9xho4aGW2kkeDokE0iUCeU/uRda9lsOJCQHNVFuRj2tfraMUKT9pf
         6gOpSP+D/UHohRiQe1H7oei006FaDHDkDF66CfViTmzD1XDzZhrWm3NkuVnTxCyLf4uk
         hZwvacl7cc5W0SXhbB0kkIkcgA91lgZ4I/wZsknbHGFFtrpzznFv10+DZJPKYegcMogZ
         W76njzfHQFW8jBWbg+y8Tr7ooloOMGhB9azRZqHY6BaS7yF5aNG3+NQM7UZ7F0Jwfjil
         BJ0vNxRvXgsgOuQgXIKsUZJoC7GXeujNQmr3OcbDTqUCGjtxmVboixVRud/GMILwwX6K
         DAIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=xiiURFXENW6+Ov+JKbVYk6NWMU18FQ9ta8PXw2AHgRU=;
        b=wNLTdMWRvjeSCSmkKkyxU/297SzrlLaH2H8ussZ7Cr7/GS8uuHkac46DbBW/oDVYGh
         d57e0ZvRipK6JOJUfs6XE4Gk7y4fSkpyR/y/bfgiNRb66rIkljE6DoiGIftBGf6lY6C1
         tlSBmpHzqUwQJGrQYHHJrcQ8xSddLjSwV2f/7Hw5hzHU9DxdcnXm3yEJW0OF+zIyq5g0
         v6wIJY1vfZ/vZ1lzEdtpqqd2SJN6YIH7l52yCdwKyBCwwqXiJauYjWA/hJ0NatST8oKx
         OO96ceasBCFrR/gB8wVy3YZtOu8fXyBsvnESA3+10zjDghAESwpVTnW7XNed0RhXy7fU
         fwxw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id c12si402252wrn.2.2019.11.01.00.36.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 Nov 2019 00:36:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id xA17aEFq011006
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 1 Nov 2019 08:36:14 +0100
Received: from [167.87.40.255] ([167.87.40.255])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id xA17aEZw009031;
	Fri, 1 Nov 2019 08:36:14 +0100
Subject: Re: v0.9 vs v1.1 interrupt latency raise
To: Chung-Fan Yang <sonic.tw.tp@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <a54a651c-13de-4aa1-9c32-475ebddc4e6f@googlegroups.com>
 <6defc2d1-96ac-c470-818d-1c9a8e1d8725@web.de>
 <eed4bd9a-7020-4182-9949-d529bef7b3b2@googlegroups.com>
 <48bb5fe2-9b9f-4ad1-872e-9eae4bdd2c43@googlegroups.com>
 <20191025155257.6af12e29@md1za8fc.ad001.siemens.net>
 <76ecfa10-3a69-b5bc-382a-48a59c345637@siemens.com>
 <579d40f1-a8f4-4144-9405-3bba1ea23c14@googlegroups.com>
 <2151b869-9732-4483-8659-90234a971f1b@googlegroups.com>
 <09cf7ef6-0bb0-0d3e-cab3-493c500c6559@siemens.com>
 <6705dfff-635e-4182-a684-86d0b861e94e@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <22847d72-665a-7c0a-00c5-f015912df44e@siemens.com>
Date: Fri, 1 Nov 2019 08:36:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <6705dfff-635e-4182-a684-86d0b861e94e@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 31.10.19 06:57, Chung-Fan Yang wrote:
>=20
>     Interesting findings already, but I'm afraid we will need to dig
>     deeper:
>     Can you describe what all is part of your measured latency path?=20
>=20
>=20
> I measured using an oscillate scope and function generator.
> I am using MMIO GPIOs. The application calls a system call and waits for
> an interrupt on a certain GPIO.
> When I send a pulse to the GPIO, the IRQ handler release a semaphore,
> interm trigger the scheduler and wake-up the application, which send
> another pulse to another GPIO using MMIO.
>=20
> FG -> Serial -> APIC -> RTOS IRQ Hnd -> Scheduler -> Application ->
> Serial -> OSC
>=20
> The timing different of these 2 pulses are measured.
>=20
> Because of the waiting mechanism used, receiving the pulse involved the
> system call / semaphore / interrupt handling of the RTOS.
> On the other hand, sending doesn't use any of the RTOS feature.
>=20
>     Do you just run code in guest mode or do you also trigger VM exits,
>     e.g. to
>     issue ivshmem interrupts to a remote side?=20
>=20
>=20
> I tried to instrument the system.
> So far there are no additional interrupts send, nor received during the
> whole process.
> VMExit do exist for EOI(systick and serial IRQ) and when I fiddle the
> TSC_deadline timer enable/disable bit of APIC MSR.
> The whole process is not related to any ivshmem operations.

Use x2APIC in your guest, and you will get rid of those VMexits (due to
xAPIC MMIO interception). But that's an unrelated optimization.

>=20
>     Maybe you can sample some latencies along the critical path so that
>     we have a better picture about=C2=A0
>=20
>     where we lose time, overall or rather on specific actions.
>=20
>=20
> Basically, it is an overall slowdown.
> But code in the scheduler and application slowdown more than other places=
.
>=20
> BTW, I tested the again with a partially working setup of <kernel
> 4.19/Jailhouse v0.11/old ivshmem2>.
> Currently, I cannot get my application running, due to some mystery, but
> I am observing some slowdown.
> Pinging the RTOS using ivshmem-net the RTT has about 2x latency:
> =C2=A0* <kernel 4.19/Jailhouse v0.11/old ivshmem2>: ~0.060ms
> =C2=A0* <kernel 4.19/Jailhouse v0.11/new ivshmem2>: ~0.130ms
>=20

Sound like as if we have some caching related problem. You could enable
access to the perf MSRs (small patch to the MSR bitmap in vmx.c) and
check if you see excessive cache misses in the counters.

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
jailhouse-dev/22847d72-665a-7c0a-00c5-f015912df44e%40siemens.com.
