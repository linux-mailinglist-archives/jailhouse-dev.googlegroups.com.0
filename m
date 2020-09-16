Return-Path: <jailhouse-dev+bncBDRKPIXWWIFBBINRQ75QKGQE77G2S5Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1DB26C056
	for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 11:19:29 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id y3sf2293728wrl.21
        for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 02:19:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600247969; cv=pass;
        d=google.com; s=arc-20160816;
        b=uLO5kM0c0MU0G1erAe1fgOjL658W++h0+C/jIdZ2988VNBiz0h8+10k9Zm6QQLfJ4N
         hR6NlGKqIaLvNDttR8vlag5XfrXUysJbjHR9DvTzv53vUXVQ5nvqKZ2Y3jH25qe1jV90
         FLSDJgYxSkEuGYwDwwtcMjxhwbEnbPhiS+IRranlTjkzWTt/ZssFs+/holHqlhqZAUzj
         31OnXVu8oCZYpY89S6EDdtwnNqFElmAF7r5XvzBpqMFZVbkYZnlKYlMQTXeHOfLTy8rD
         YdCwBM8V6yHeH8+4MWYgtrkM43miNZGzKpMRm7iENds2P7gqJ6n2h+4PSeM4fkgNOI9Z
         IJjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:sender:dkim-signature;
        bh=A3+f4+DlJfKvhhbocJUp7nSi7mp2m64wunMb+urF7Mc=;
        b=jARAuL9VLPVAuuoHzGjITjE3Bwehjhz+WFxATb3ng6YtBYghEoNFABmQEGWnZ7c0J6
         tdD9XbRyBh6TvsR97KaWsjeyjgZUhBisbH1mvCwt8rjqfw2yEM4RgL0dV14DJKCCcWPY
         lIA49QA83aPea7CPHMFwnhW4Rwgm6fffqGD59m2ZW3TjkGkp3TzLungEv7tobiGTKXR7
         pqD7Epkcz+FhaOCqNbmt0rCzwQpLsmE1p1YINq8KKIRImtynb+pco8FiUEZtSuGVWt6E
         7axVfxlx0uy0O00YMk0dtDZfCDVIO2/05CuWH9io/dVpZcyPQPgNqGAVpwYtd+HqwtOt
         Vgxg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=BofnZ1Tk;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.21 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=A3+f4+DlJfKvhhbocJUp7nSi7mp2m64wunMb+urF7Mc=;
        b=FoapmUJb42DhA/FXrekqTRx7kZ0pSwQmhFF1iyD+6sXDHxeOYfZjpf91+ED++NWYhQ
         Gkm/77mzC4T/bJDCpSBMO+Z3GpFOKItvgUi8DBwYxPD9NF7GlAVQ1j2zzhADOp7q66Rq
         pLt4b2bKIlvc+BZvA54/2v2/R1YC8SUHBGOipZzhRplY8B28FVePGlHagIsiblcmx3ku
         dS+RjdWBu6PQhBUDjqRWTArmoyUsYzxnxTlzzX2aPE82cYfrM8nCstyMU5Yw+zi41gst
         6X/RY9pktXud1qGPZGL6xgKkxs0F+65DhXjfEtAnVHGX/CsqU8C0/LOHaHZ2TB4C94k/
         QvBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:subject:from:in-reply-to
         :date:cc:content-transfer-encoding:message-id:references:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=A3+f4+DlJfKvhhbocJUp7nSi7mp2m64wunMb+urF7Mc=;
        b=WiFX+yilvx3VbKxVYyyBTmF3h9jn/+JkKaDbLcZILbxLdCnN9rd03RayaqLT+3XALD
         zLFJ5w7bcOaE+RYd/oFIoz5sbhOQOJ/DUsJyjEeo3USnKH7zCajBFlPF97aCaqTuLPFw
         J5ZbhOkLpJvrRVc+BnsQ7refcNzrS88zTPDFhArZGuCDnuR3OZBWRHgWUv+TAAOGtEdu
         u11yVA5lDc9q6oXJ6tgwQZMRuOYVOxnr8Zylae1kAlkKkP9rgyI3MTxfrvsk3g5SLzTT
         GRPwu0dR2extPc7eFs7K/w3KSe2O58FpJStWKtSIn30HPklU+q3U1ysmN7Bhbhqs/nOc
         Ftbw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530nzwB5QWtyU6+4wXYpqPfaSBrObrfZwdQdbwHKMnPyJgJhTuH5
	rBl+ERDMWymdJakzuUWGFHo=
X-Google-Smtp-Source: ABdhPJxIKZyfqSItdtnvQbVJTe6alDLuaWF0+GuvjZeY7blM2MDcVSuHqjL0goqBr9wNpim3QSnKJw==
X-Received: by 2002:a05:6000:7:: with SMTP id h7mr27266316wrx.16.1600247969512;
        Wed, 16 Sep 2020 02:19:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:dd0a:: with SMTP id a10ls1516363wrm.2.gmail; Wed, 16 Sep
 2020 02:19:28 -0700 (PDT)
X-Received: by 2002:adf:8b1d:: with SMTP id n29mr24687939wra.383.1600247968347;
        Wed, 16 Sep 2020 02:19:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600247968; cv=none;
        d=google.com; s=arc-20160816;
        b=G+Fi3XedVR2I6U/J3lHnfz402c6p2lQgf+84smhvWiGgeU6yF4Ew4fU1hJVj/Mut+I
         2hWoFAkx/Jkcx/dZPrOw1ehEPf16QkwB32yNPpj9OgRxSw1PXiTxhvPIeubLzUy021WD
         gFaQ7YRqpfJ3B/Vmnt3ggILQHlL8v8TkkHXcHEl5gYOeQ6dZoQFs1mh/yQwXig5Qj4Tn
         DdmEc6uC6bQRUd+I92H6ygYcH89mtQrTHtZtmCouPMNJ7o7nPpCNF3e+u7a9NCRyH1rZ
         hBafI7HCkMFClU8x9kHKtv7c8PD6cUq448hZY9FajITdMjX4zK1n2n7RyuBVNgLJGw/z
         k3sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=bwe+wQRyf1kSpQZq8N4hycdC1auFl1do5+RYMMCirtY=;
        b=Tzz/4+8vYMN5TkRa1tlO4GFQI8gYreww/BE8N/FKmSLGiAub92d5iuRF/qZkyli06I
         yBzX3yoMpXXhEcpPu1WmOtRCVjGb9slJOJo5PsH2aXWoZdusnaXYnxW83I46wtprCaZt
         s7fUQivYGiFEjHx4i+29BNiEFI0N67I9ut/nnG8VTQ6c2FEibcBGkpjZUDwzYf5syOGJ
         PQpofZ2sUAIFrsZAf+rtSRDTO1YH0G6OjLCAeVJDaImkQEgP2UQ9PUO8sEdjh3CuOLyt
         A1y/iCFDw96tPZcbxMX1bPVqJR61D24V+btiuema9zQY1SiVVLaHzUWH8ciRqjLOcFNo
         LXNQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=BofnZ1Tk;
       spf=pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.21 as permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.21])
        by gmr-mx.google.com with ESMTPS id z11si34629wrp.4.2020.09.16.02.19.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 02:19:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.21 as permitted sender) client-ip=212.227.17.21;
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from meter.plexim.com ([212.126.163.234]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M5wPb-1kPKPk3z9H-007X7s; Wed, 16
 Sep 2020 11:19:27 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH] arm64: Make sure SMC calls don't have side effects
From: Oliver Schwartz <Oliver.Schwartz@gmx.de>
In-Reply-To: <068286c9-d55d-d259-8243-5dfaf10cba5f@siemens.com>
Date: Wed, 16 Sep 2020 11:19:27 +0200
Cc: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C2B8E562-224D-4B4A-904E-23DA8DE3DFED@gmx.de>
References: <6B88A347-1633-47E4-A3CF-DC37738FED1E@gmx.de>
 <068286c9-d55d-d259-8243-5dfaf10cba5f@siemens.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-Provags-ID: V03:K1:rNd0xP7PFHZB8ZYqBufm5+vosMDBCunS1PBpRw2P2IEx93QvkiM
 Gi+ZJC4u7XupvO771L34rjhq99M2xcUKh3tjI+zrx+VuTNocwbSQCE2kcFcbhxd7W+h1Zfn
 uapBsyeXJokdI33THdKW79OnO3cvvVsrJIQzvoiki3EhHIwEB5U/aLdzpdljVUqvLOx9HDd
 bphOrtwT87+AVEh/U67Eg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/KK/BvlaKXc=:J03E15Y6DEHfWUxec0eg0Z
 JzO1FR4DOiO/MfwJ3IzWN9jz75mIIet0x66waAqjreO6oAmOx/XRzLyspAZd3btrqxMR4gKfy
 lA3d5jfKLeFPY6n1Lzc9e0nDixUqX6XdAYJLlBPQmxGJ/X4hJZzM+7/purNwoNcr+w8FAiSB7
 gFEw4l6iiZFJvf4Gn9oTvuJS8BM+/5TbR/pwv26Ir4YzH9Ik0+fE6eQvDCfkMr1kwkPtIJFz7
 OXDssFG75XoS2Edgli5AiRfFqjn5tgWAkCJJVpiinVMRVm1khfafJfsp/60olxJhaubV0uNDN
 soPXYLxAXDGh/SCV8YaU8SWJ/e5mvVPvnzoEK/btMMJkJiFb3h12ZTpb4T/0sOrPNPXbluiRP
 lrZw6pixqBgo9vmY72J1sGlOuUhd/YArOVYyEgMak8y0UWwoH/lhtQSmfqONrhG1ZcBUP0Wy5
 6dEHrEo4LJ4bAUEtNzJ5j7DeNtUVxX8K347di/FMG6z5hVD1w1JVSAvrAKYWrSdPTHZ+Drl1+
 D0CxX0GbMnYk7oQBHHgU7GSJwpfaFK+S7fwrpK8bd5cITlGEs1ZCgAsrOpqk63VMklhhLrE+J
 GI6Tr0ntI459X+utes7zuJkBOpxNWbee5dQ2J8nNVgl7Gh2FK9npN1r+djUqE34h34bEui88F
 AcksZiDHmCO6evFzNZiq/95ufUMNmXho9x8W0mKwj8J4y9ryC6Ywq0zNmju1XtMamJ/2IHYFl
 sTILeawIZB3faFXOQgv8OznkY0Lk/0abUBs3LC48uv+6Ws8RmKOhrQQRADCeI17fmx/tOmLVT
 JehDFRDTFq5+M7XZvy5LDwGeSTQcDBarvN0+44aPxPKB49vN96Hoc6Q0GGtGI4oh9Vh5BDorK
 kJ4mc+BLMqa1q1gJBIKvQ+duTCeq7soPRdNQOfjIMpPvH8daLdeh5NKU7q4KVTw2HkhsmqnrQ
 JlX8cG3u9x6u8sK0VBaSBXtnkg/EVkCkZJXVqRKjrQ0vDynEUqEjjbPARxPAb6qcRKsRpfRjR
 WfwCCbIzUViUs2qPl3Aa1oF2+r+FUEBeW+GUA40O7a8DgJmAg0dBVSMElcZ0xyQF4SM8AK+kP
 3VU4Gw1LKccEWcgrY5CvQauKqj0qM34RBf0vW5vY6y2KyMiQegGjxiIHhQfnZHPckBqaf+XGU
 TIwLeFV7R9uGn433spind+8KqBd/39oMpegB2Ssnjn4wuqPj6xTe19htZqjOnj/5nkyDavPnD
 eqfpPiynkpbkffN2PteNPc+0xpXSajTIsMqR3zw==
X-Original-Sender: oliver.schwartz@gmx.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmx.net header.s=badeba3b8450 header.b=BofnZ1Tk;       spf=pass
 (google.com: domain of oliver.schwartz@gmx.de designates 212.227.17.21 as
 permitted sender) smtp.mailfrom=Oliver.Schwartz@gmx.de
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


> On 16 Sep 2020, at 10:28, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>=20
> On 16.09.20 09:12, Oliver Schwartz wrote:
>> SMC calls may modify registers x0 to x3. To make sure the compiler doesn=
't
>> assume input registers to be constant, also mark these registers as outp=
ut
>> when used as input.
>> Signed-off-by: Oliver Schwartz <Oliver.Schwartz@gmx.de>
>> ---
>>  hypervisor/arch/arm64/include/asm/smc.h | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>> diff --git a/hypervisor/arch/arm64/include/asm/smc.h b/hypervisor/arch/a=
rm64/include/asm/smc.h
>> index 1a5d5c8..e7b6723 100644
>> --- a/hypervisor/arch/arm64/include/asm/smc.h
>> +++ b/hypervisor/arch/arm64/include/asm/smc.h
>> @@ -28,7 +28,7 @@ static inline long smc_arg1(unsigned long id, unsigned=
 long par1)
>>  	register unsigned long __par1 asm("r1") =3D par1;
>>    	asm volatile ("smc #0\n\t"
>> -		: "=3Dr" (__id)
>> +		: "=3Dr" (__id), "=3Dr"(__par1)
>>  		: "r"(__id), "r"(__par1)
>>  		: "memory", "x2", "x3");
>>  @@ -43,7 +43,7 @@ static inline long smc_arg2(unsigned long id, unsigne=
d long par1,
>>  	register unsigned long __par2 asm("r2") =3D par2;
>>    	asm volatile ("smc #0\n\t"
>> -		: "=3Dr" (__id)
>> +		: "=3Dr" (__id), "=3Dr"(__par1), "=3Dr"(__par2)
>>  		: "r"(__id), "r"(__par1), "r"(__par2)
>>  		: "memory", "x3");
>>  @@ -62,7 +62,7 @@ static inline long smc_arg5(unsigned long id, unsigne=
d long par1,
>>  	register unsigned long __par5 asm("r5") =3D par5;
>>    	asm volatile ("smc #0\n\t"
>> -		: "=3Dr" (__id)
>> +		: "=3Dr" (__id), "=3Dr"(__par1), "=3Dr"(__par2), "=3Dr"(__par3)
>>  		: "r"(__id), "r"(__par1), "r"(__par2), "r"(__par3),
>>  		  "r"(__par4), "r"(__par5)
>>  		: "memory");
>=20
> Good catch! We likely have the same issue with our hypercall interface (j=
ailhouse_hypercall.h).
>=20
> We should probably look carefully again at how Linux expresses these cons=
traints: linux/include/linux/arm-smccc.h. That appears to me like we need "=
+r" for input/output registers and "=3D&r" for those that are just input bu=
t might be clobbered on return.

I must admit that I don=E2=80=99t fully understand the =E2=80=9CConstraint =
Modifier Characters=E2=80=9D chapter in the gcc documentation. Please feel =
free to modify the patch as needed.

The 32 bit implementation for smc and hypercall also need a fix.

Oliver

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/C2B8E562-224D-4B4A-904E-23DA8DE3DFED%40gmx.de.
