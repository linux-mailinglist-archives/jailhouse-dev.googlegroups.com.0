Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBGU2V6GAMGQEORQX7II@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D8244C255
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Nov 2021 14:46:03 +0100 (CET)
Received: by mail-ed1-x537.google.com with SMTP id i22-20020a05640242d600b003e28aecc0afsf2392683edc.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Nov 2021 05:46:03 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1636551963; cv=pass;
        d=google.com; s=arc-20160816;
        b=HdlQoRRfuURIEOOqDP8n+Jgvf9MVE/K55TUGTXkfiN35vs3Plk68ARtVEmgx2uZE16
         iaANbTrIzzjOqJYHbl4K8JL0PFlmLHvSFs/FLQi5VbIHgIGBJvqpIYuKKntSVqOOjhOe
         2H+f6bCZaIbyeLdKYuGwvSzLXGPWbWNDwQca9Mf1iCEYTsz9G9jmQgpr8V0MsSGsO8Lq
         hb6OCqgOHOdxQvRWC6w686wkJjtR11yJIG0JlACdfDeR1e3/60XYIuCXj1Qh23IxsYDq
         b7hvJvKmOd+Ola+HE4djp1/OLRiZ2qLJdmgXf6lVeZs+ow1+IDBh7bVsYgJOEK6TsL6X
         Rbrg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=ahY6A+Z+SULW+fd0FKvKPxyN90w65B7IvlbJoeW64MQ=;
        b=aUHfRERyTXwVLvpDnEmfG0OCMkZWMlIkN9QRfeO3UOnjKsB1SmoRORPzzlhm2zHWI9
         93lgfUe4lu0LMMdut2Uhq6DJTrcRSKUKHmcKkiv9V/Kwe3GZ5vS3Qsnf1xozSDCwLBQi
         7llHB9cJwAnPUQK2C3zjLtZ2e6EpEWVrNCf67DDkDJ3jesodX9iXH05OaJKj3nA+guwP
         9UbMgCHYSrAGPaVDfIooV52x8ph6jJ/WRvByhZJFIpZ/NN0iuCx4LGI1tWIcHX/Qi5w7
         1PsQwLjMN1WtN71NkUr5GMv2ozz2XepLT4T1NvUi9fhjHXVFYcspSwr6Z973UlStGN99
         LRiw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ahY6A+Z+SULW+fd0FKvKPxyN90w65B7IvlbJoeW64MQ=;
        b=dY7Z8g9ajudDS8QUV6L//nqaioh8KA+lH4szWrHbyUpCx354SyCNtYf/VI+w0X4ZVm
         Ek6zG5Sc0rDOzGQ9iZEfRIv8weOvV6tLuK1M6ih1efll0ud6ABiYWdPtDt8s/Oh7CrYk
         zokgA6IIQoJF8WQzV8rFR4NMoO6Oriqt7zzJS2g9GTa6OcWd7AC76h2L7xUSaNOLM/bi
         P5f+W+4A3GGPCSRqV0/WJ0AS+mrBwBrjjQcIh5WZ4OG620/7WGPfvsOWPvFboTBfdkiq
         qvMVZx6zkYkybLgKapCMxU4rP5QgBXSBb/2CEPNnzD5p6VILo1tF733A22g5W5iAOiEJ
         zctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ahY6A+Z+SULW+fd0FKvKPxyN90w65B7IvlbJoeW64MQ=;
        b=xj5+oH71s7qBj+yINH3t8quC3CgHxGAjbrIYwLt3zfIwMM3F1wOdDU/tCJPsrY4+BH
         nTYraX9n1ZzbsQdGDjEC8hNkEq5IU4PdESVZTeUQBtIceIj5c3BftThDQrLfdXc/RgYB
         D0swN2tbrZZkaSLzP3zguYTD6Y/A9bxVkxXSBUbZuj/uqk93QXAwRPtcGyXroBGItUya
         p20G4JlAx8Re5hRhQqG8NsqO1aY+B1W+GQeVLWIfnJENEAZV4Gi6MfydpshfSNNWxJV1
         2NciCgLxQu5voFAgAP5OsoYD6IomQljLOk/W9/kiDOzR0kaauNR+ZsnoVYN07ycVNmMy
         ZZnA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531yjqUeRCNcPOdFqJI58Tqski21szv2vwwyv+eIXXGrtYJAvLmS
	fkG1Oh17/2jF71pa9m9AKzg=
X-Google-Smtp-Source: ABdhPJzCeNksya/1aFkW97x1LipWNoX4cQcZX+5T9K7ei7kA7ACHIvnNoWONg607DXI5HAjLjcEUzQ==
X-Received: by 2002:a17:906:3017:: with SMTP id 23mr20757754ejz.382.1636551963141;
        Wed, 10 Nov 2021 05:46:03 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c0d9:: with SMTP id j25ls4487170edp.3.gmail; Wed, 10 Nov
 2021 05:46:02 -0800 (PST)
X-Received: by 2002:a05:6402:27cd:: with SMTP id c13mr21434948ede.365.1636551961985;
        Wed, 10 Nov 2021 05:46:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636551961; cv=none;
        d=google.com; s=arc-20160816;
        b=Vw1/G4tUjplTPgtU3QH0eoUttSgPQ8lL39aXTXiP40A1KcCq3G7+SJtpHT16gckG1h
         x3VeA5asJFTRTkXFxSjrVl4NGZRhqBlnCfaVXzcGmCzvdJtkc0O+2khJLqUhIFfPEs6H
         zd0wZMj1B7W1B539BHVjOaKYcAUISvNHtUSRru11df7lEP0mB7Ugt413/Z0hYmiVumtR
         tNl4UYfHjb9GkuNfnb4N9YFQFy/L91pNARlRsQeFK1Bt55kT6EkVsKofPgxCUfR0Sjf+
         z6bD7oNUXaATSLJ9eZkUyCrS0Mu0Hy2CfwdAArPGLwxOo7m/qiv7OcVHNCwtxRT9z0C9
         nrLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=jC3vmtWz9117Z0raHOLeXrlSKdJfvPj41vQWHb161MA=;
        b=jwI4cAzyK9wUOOU+EeYGtJwpbhs7EFdeX/tho0mOkEcNjTOWT1TlifZ7K7GMskvfum
         7R7SEjVm8NsOsq+NaV9ojClTRINKnxg95Lw70Ercrfm8bc2mIogXO/gDqnB94l6kDmqR
         5ybKHonsorJaU4UFv4BKu9CKGIqXCzS9L81ZoC032HiJz7IPFI5AGRJLOTZHGYZRpyhy
         WKm4IWGPEDlLGZSAPY/93WKJWdFLZlMb21V02bSB+XZxDkmWCC4gk3UZwDQ7jhWnMy9m
         DllVBBhnGFS9TVUhaHpDrh8aeyVnBVAVdnvJk5eHBEl4upcHjkhXjYZF49nJGXCs5VkQ
         lRyw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id d2si263041edk.1.2021.11.10.05.46.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Nov 2021 05:46:01 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 1AADk0Rr009079
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Nov 2021 14:46:01 +0100
Received: from [167.87.75.31] ([167.87.75.31])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 1AADk0CB016384;
	Wed, 10 Nov 2021 14:46:00 +0100
Subject: Re: implicit declaration of add_cpu and remove_cpu
To: Andrea Marchetta <marchetta.andrea@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <5e84c231-838f-433d-b584-5876c477087dn@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <8717f502-5701-bfaa-2327-cfb6fc99123e@siemens.com>
Date: Wed, 10 Nov 2021 14:46:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5e84c231-838f-433d-b584-5876c477087dn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 10.11.21 13:05, Andrea Marchetta wrote:
> hi, i'm currently using the 5.10 version of jailhouse enabling linux and
> the master branch of jailhouse. when trying to compile jailhouse in the
> linux kernel i get the following error:
> error: implicit declaration of
> function =E2=80=98remove_cpu=E2=80=99 [-Werror=3Dimplicit-function-declar=
ation]
> =C2=A0243 | =C2=A0=C2=A0=C2=A0err =3D remove_cpu(cpu);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0^~~~~~~~~~
> error: implicit declaration of
> function =E2=80=98add_cpu=E2=80=99 [-Werror=3Dimplicit-function-declarati=
on]
> =C2=A0272 | =C2=A0=C2=A0if (!cpu_online(cpu) && add_cpu(cpu) =3D=3D 0)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^~~~~~~
> cc1: some warnings being treated as errors
>=20
> any clue what's the issue?
>=20

You want master/next, not the (meanwhile serious old) last release.

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
jailhouse-dev/8717f502-5701-bfaa-2327-cfb6fc99123e%40siemens.com.
