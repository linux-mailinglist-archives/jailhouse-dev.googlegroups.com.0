Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOP35H4QKGQENEFE4ZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFF82466B4
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Aug 2020 14:53:13 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id co15sf6315482edb.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Aug 2020 05:53:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597668793; cv=pass;
        d=google.com; s=arc-20160816;
        b=eZB4+rLiLGTh9UfC/zYqTVZ7z5pgy4P3eXqa5Gwyz4PtIj8at69G6iVuQBAqKYI64j
         n4WQslCdm2fH4LqidFFSAGhXoBwYvh88yk1oFeRhNaQKoZ7ss+EOK8gk6LGyyG0swps0
         iAHNuLNXkbxvZzmqOPRw31bHxGORS2vM+jXD5IBAhtl+ziRhRWbOmPhYAyzTlVlgZogV
         S1sIVyuJaFD+YGc34aiybufikktKnoACzg60O87+SyeXNzdDQfNqiyJ5LwK8/OlEU5Hx
         rbP59tptVAUmv+uHu7a0uFRZ/cS43fDyhTRs8B6+ryYLjYlFfv2jnK1Zdq74FSa1ecpq
         6GqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=hbk/0bygJxWsjQjMelOHYwtSwqUeNBuFnNho6ZHemtE=;
        b=A8OmL93954QDL5or3DHT6oj55Ri0izx92phzDSk+AKShI1rk16DcuU/JfaPOW/9MeP
         YiRZdpa2A1DM6/HCp/rxSqcl054MiTUquNsVc2a3SnS1+LiGcqTKlVtA8wPrmWwZBgic
         PgLm//OTRLUGVXGJqkaYC0KFxW0tbRTJrIoGsc8m3lcd1X2Z1H1hiiu4CPP9nIRNumzo
         rqtq5NE++rpHo4eFObGTyhjJhZDSauJiedWDkcDJOcndXEfwX42XieTBteHElxLy+Fx0
         JLOIzk1wKOSY8EiLBSV3mev90pyt2Nd9lfM3xk8TwXSW5oOo+Ub9bmo9xv79uGLLpWdF
         /D2g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hbk/0bygJxWsjQjMelOHYwtSwqUeNBuFnNho6ZHemtE=;
        b=He1FPXplw+IW7ozEyGVecoQPAzaTULSvZVAPfYaqTUhOygy/3LOJ/aUTc1Wepn0dDg
         YdUep44ahT3aoYSMRSngmei1kZ9jvJ+k2BWJ2vOtZ2rW+QW+20EvShhUKJh1zN3JpkXu
         5bmQnxSsb6jgfNYUeRgUiFYW2ORsmJV1NFLObt/wrHV5XlTEOJMm4XaoKxOgfN5cen15
         LUmGKFo4k1uUJg4B3bpDbx66/D3aBVjhaKi6yYbP6uXMl8rzOypc26yeP1l7oLFBmMUG
         IfNPEEfQqkekk01cfMae5RfG/yu0lbxUpVerj9yopiSW5aQXIYNLwF8g2LtBJjiJXJNz
         T9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hbk/0bygJxWsjQjMelOHYwtSwqUeNBuFnNho6ZHemtE=;
        b=MFIkOWokqurEn2zEuKzAK3wDmv9GwltE8nr9iRq6M3UQYKAnE6dIEOipOvsLhrR6N2
         8FZobx/uwU6GyIG/6Tc4WxfdAN+Pg8C8QWzikCzNA/GesgJvHNzGAqtPJQOm/BPuzA1/
         qPD617Del+GxA2N0bFm1NiMv/HP0o37LxqROoKrNO//7W77FL8g5Fit4GA4QHzKcGUaL
         uTW65aOKR+aEcUlzeiHtuIkXjDEkbS/thZMKhG4oIkeDWXvlHs1skjmgnjw8+K8IxC6z
         cAuWTeKt4DfviKo7hbAMYY0QdoarK9yCSNqp6XsJVACP26YHUUS4IOm6VwmM112hj6WM
         l6kg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532iaa97GjFSKdNikYUEezfHw8k26D0dPkUPzi/PkyEq9vFT42x/
	ZP2YIKo7QiJvYSugby3PGPg=
X-Google-Smtp-Source: ABdhPJwC/ZIPS33v7Lx+aOtjjTPbqsAHYTzdlBeD19U3iJm52TkjDciIdqY/UajWK802sdOprMBWhQ==
X-Received: by 2002:a17:906:344a:: with SMTP id d10mr15756864ejb.244.1597668793727;
        Mon, 17 Aug 2020 05:53:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:bc05:: with SMTP id j5ls502737edh.0.gmail; Mon, 17 Aug
 2020 05:53:12 -0700 (PDT)
X-Received: by 2002:a05:6402:16:: with SMTP id d22mr15249889edu.175.1597668792792;
        Mon, 17 Aug 2020 05:53:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597668792; cv=none;
        d=google.com; s=arc-20160816;
        b=UAdmK6rwKK2PhvVloRs79ejW1IgvKDSgMBWPTN+GkuzjDSg56cQIZYoh0H6cexrtE2
         iIcL24cSBBrcTSkd+hWa2FXftK//8Pp9G7+T3AMMQ49CTMQchUjxGFFVvf9dE/njliKY
         MPbSFEscP8NFFXwAv1gCvZRosqnWGcyjrLFGBmJkhd18JqCGYfaqawy8p2wJBIlG9Z7C
         ywC+GkYyZT4DzIORMnpybHfspTzf5dn+rBIGwP+ybKXFns2A7RiIEQTZhixvH57q/wWh
         tuPOI57epd2A0osxRNc06FoESDwVcCuvYdiWt53dGLhih48JdJh/TsgI4SfKgi7y6MTO
         91cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=vpbcidWALaLNeIh2ew5f75nj+mMSZ1iCoOOFpeSPW98=;
        b=E31dUXiZ/oX0NhsSM6GdE1InjBxrVMAllmOH7CLy4uQ8W5/wUO/kKoruE0Tefx7n/j
         XCRSDqpiGjean0nMHhCNDZxTr+s+3pBWs54e7S8+vpOvIJKJItseauGtT+FWvFVyZBmG
         vzNUDIvheExd16PxZPJkliMqzDg6KWYEmWReG46GTtLOrMS+WzRcgw3ws3GQ+pReNJfB
         R8/xbYgWFGRB2IUGggggmW2ZKrSvl9ZP08QHSZwqeGBAG8rJb9oKCxGex3WmdR8eMjL/
         SKnmOli87cHAL97nH+AdkpdiSk7b/AAZqVVoorjJGo2+mTXTvackdFsetcKef9i1XGAf
         X4cA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id h10si831482edn.2.2020.08.17.05.53.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Aug 2020 05:53:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 07HCrBtb006610
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Aug 2020 14:53:11 +0200
Received: from [139.22.40.250] ([139.22.40.250])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07HCrBW1026292;
	Mon, 17 Aug 2020 14:53:11 +0200
Subject: Re: Starting jailhouse on real hardware without QEMU
To: stranzjanmarc@gmail.com, Jailhouse <jailhouse-dev@googlegroups.com>
References: <cf0c959a-a862-4ef3-80c9-2037c88fad45o@googlegroups.com>
 <ce8b7368-3da1-fc89-d1ea-628b25bec62d@siemens.com>
 <ee6a7e80-c88f-4044-9cf9-209aa0fc8d61o@googlegroups.com>
 <ce82e02e-1b8c-4979-9b3f-8ab0161e067co@googlegroups.com>
 <6e9595aa-ae7e-8808-9335-29dbe7345ad6@siemens.com>
 <df0e6993-5f54-4d99-95f6-b3a36ce677d1o@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5775d148-cd2c-6764-9242-e1742bc018a6@siemens.com>
Date: Mon, 17 Aug 2020 14:53:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <df0e6993-5f54-4d99-95f6-b3a36ce677d1o@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 17.08.20 14:31, stranzjanmarc@gmail.com wrote:
> I booted the Linux PC several times and then always created a new system
> configuration with "sudo jailhouse config create configs/x86/sysconfig.c"=
.
>=20
> Interestingly, the configuration generated in this way is always
> slightly different!
> The following section is always affected:
>=20
> =C2=A0=C2=A0=C2=A0 /* MemRegion: 100000000-23f1fffff : System RAM */
> =C2=A0=C2=A0=C2=A0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .phys_start =3D 0x100000000,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .virt_start =3D 0x100000000,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .size =3D 0x13f200000,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .flags =3D JAILHOUSE_MEM_READ =
| JAILHOUSE_MEM_WRITE |
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JAILHO=
USE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
> =C2=A0=C2=A0=C2=A0 },
> =C2=A0=C2=A0=C2=A0 /* MemRegion: 23f200000-241ffffff : Kernel */
> =C2=A0=C2=A0=C2=A0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .phys_start =3D 0x23f200000,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .virt_start =3D 0x23f200000,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .size =3D 0x2e00000,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .flags =3D JAILHOUSE_MEM_READ =
| JAILHOUSE_MEM_WRITE |
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JAILHO=
USE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
> =C2=A0=C2=A0=C2=A0 },
> =C2=A0=C2=A0=C2=A0 /* MemRegion: 242000000-41f37ffff : System RAM */
> =C2=A0=C2=A0=C2=A0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .phys_start =3D 0x242000000,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .virt_start =3D 0x242000000,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .size =3D 0x1dd380000,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .flags =3D JAILHOUSE_MEM_READ =
| JAILHOUSE_MEM_WRITE |
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JAILHO=
USE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
> =C2=A0=C2=A0=C2=A0 },
> What can be the reason?
> Shouldn't the generated configuration always be the same?

The kernel region is detect as separate RAM region by the config
generator, and the kernel might be loaded to different addresses each
time. You could fold all those three together, they are consecutive and
have the same flags.

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
jailhouse-dev/5775d148-cd2c-6764-9242-e1742bc018a6%40siemens.com.
