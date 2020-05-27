Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBR7IXH3AKGQENIA374I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1611E453B
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 16:08:08 +0200 (CEST)
Received: by mail-lf1-x13f.google.com with SMTP id u5sf5532871lfo.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 07:08:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590588488; cv=pass;
        d=google.com; s=arc-20160816;
        b=Qzxb5aD2vpLQTG6eWRGlWPVirN+bxsWKs6RaoTpyFKR1/E3u25b3ReH/MNzJ9PwHDS
         eFPS4e/YzAm6zcT1RFTO7aaUrwECJioW3YgGxsCIM3So12at0ck0mZB0wkcBQMYEJUmZ
         Bm4e/umtvM4EKTsU1afV/N7IiLbfF9SZZJkncUUp8c59tmDyrClWNpnFs1ovXEAM2rxo
         zhsaI2YJ9U+bY5pGiDpaTyJ9VXyOVAyuWwLd0411A9crVFgEYoHmM9lBBvPSJ4+VITA2
         jGdLmltzSxPcr3ILu5QT0hyVGFRqLpdapCkIlgHx5ehilGkfh/LSWexnVG9ysqvZAeIV
         jm0Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=mg+dGHysuNCV6E7LzDvFqWp0bieRU9ZCBkzS4AYeBjY=;
        b=OWDyrAZJdlmMouPlo7nMIEHy0G4oQdntfS8rPMg6vOBbwK4l0geIvSnPLjVMA8UkKL
         L/tp1im8sW3Tz6/IWi+MF3PjipfOmWtfVzWjefXUxa/oS4fmE6NFmOf1KZmtVXmtgYw1
         IaV9zBk1NuD/TPNpjguyDec9YtWQscygjkJF6+LSoH1NYDGYBrDHfhLKxhpU6PSjWHxL
         i826SiiqEU1g5+vwor3BC4uKqyNJ0jNr/h1BgX41mm+ky82b/0ON2jl1BOTHhE/rlDEZ
         KOdt8IUoLaP1wZvpKnPnsHJ7+s6n+TaQU/ZxhoLkVUvzqAL6KXQMuoD/dny7Ku7HXiI6
         /i+g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mg+dGHysuNCV6E7LzDvFqWp0bieRU9ZCBkzS4AYeBjY=;
        b=S9aILR7OQw4IIToBsHo9w9U2j3gzD6Ebxy4HrTxUiK2/qRhUyMSNh+4c4fsPmjw1pE
         2XdTUIngDirKATCfTO+IOSTRmx/x4f5l20SRVPoMhRtbq/BXTdaDDvBPN/ODXv5A6HKt
         vDN6ftQiKi0CGDmDm9EnvPoKOQpcoV6+teGhh/7iiiAXPXwNad9D8vPmgdyaL0g7i2Um
         mizhsLmySkVUY18+exHCDT9I8ShcMB+85pXvr4FO7jVU7gYgW6kgNetd4u10z7t950NL
         A3Fe0BQFy1FP6zUT/u0yXgNKSrnRsh1N8hiBQr3dzFofqanI7Zjdg9gAHZJjWXlB9+wE
         6RFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mg+dGHysuNCV6E7LzDvFqWp0bieRU9ZCBkzS4AYeBjY=;
        b=bxrzJp1YCjAoDJsn4SiQcuS4j6HMRs5uPUCJLEv2oDCOuwKcj1F9ZSx3RoQ6bx4ext
         PNIBQs4pAGnMBUf1a/Qy88DBz2S/Hv1Ai6JNZActaYGrt5mdlC/kxsTldrKdpaHxkW8L
         5bToBiwjQQ6FSvJTIxgmSsteE1xy/awDbhj3wW+gwBnpi6Vib31txmjSDIhkFyzNBF3K
         YKTK+9KX8pg415OCksgkKnRnOHBE8Qx4a8OpsJ0l/Vsgby/zFKDpmWF8zjcElti9HyIl
         JN+WpUsrubKxLqcUqZN3p/OdWMbGskoDNnjFtrZJsZgLfzj6jiHNXT98aY3tVir4qHmq
         Tq7g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533bg0QeiIRjItMKczBdEEqVd6jmhtbhLHRv30TiUIQWCcEtvNh+
	r8+vcH2EVSFIcONTiWsTAEY=
X-Google-Smtp-Source: ABdhPJw9XoPt93KbUZvQ9y/SKYfVy9sIVKma8UI1FIFO/rsLsoxzpR3Ma7L0IsfbWIO75uvzCWZ8Ig==
X-Received: by 2002:a2e:a416:: with SMTP id p22mr3078851ljn.60.1590588488002;
        Wed, 27 May 2020 07:08:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9791:: with SMTP id y17ls2918343lji.8.gmail; Wed, 27 May
 2020 07:08:07 -0700 (PDT)
X-Received: by 2002:a2e:780c:: with SMTP id t12mr3345586ljc.240.1590588487088;
        Wed, 27 May 2020 07:08:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590588487; cv=none;
        d=google.com; s=arc-20160816;
        b=TVxXL2W8tg1IjKH9TTHZsqXCQc1jtM9vnVB4iV9sPGxXxFfMiwIjGAYCTNge4eYzET
         yex2VgnKXrFZ6opiQ7dm5GqMh2zLPOr2mPsCmM4/NGinPcIAe9RB4kHOaCBVQteEuyCo
         pLkvjoeZJdrC3jfC+k2LXz19ctdVqBmt1UWm08A8RV6pXpIqER9eGZHzNY1jEDofPRCV
         BG3mg0pMwb4kfSsJEPRIMd3G2RODEhJ7s36uHsai8YSNb10oDNR2Z/+X0feAURXBrA4I
         dwVgJMQyT/5+y4EHtA5qtnnXc9FH98JBUKi8oIeInqyak97QyZiNtOGT/FfYJk7Ud6gB
         nliQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=nndmH2Eqzzh4eqJ6KU0ZNlsSO3WzzI4vzCiu+MnReT0=;
        b=VP2LlNvs+U4ZnapsJ4gAv7LeXb6ma7MKSw3tkvn+QV8n/2szDRiUHj8lxaV+s2KdPd
         qQzjO5hqXsio/hXhraeRD1F5MnEG6X5GF1QzjaaxjnpkCAB5A76JWdgfiyPJKYLCpYrm
         QzrQrGiOtDTyeCb6xIrMcFvGnJOa/DwyYPmZ42sQJVRAluQu3jYkZBAJg5KIE1VjThmT
         JlFRkC7cXKBO6w0pd6R+Py5lwWErTrrgUHfWHDVTkguKRZcyhlaU6zuOV3LHKdSqR/UD
         fJPh9Y1EQDHhFk/vqALUAOtsk+HBbipzrsbnLLgjAhseeneWetk79lrl6S3nkcI38iyy
         aVPg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id 14si158822lfy.1.2020.05.27.07.08.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 07:08:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 04RE86Oe030887
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 May 2020 16:08:06 +0200
Received: from [167.87.6.205] ([167.87.6.205])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 04RE85ca026333;
	Wed, 27 May 2020 16:08:05 +0200
Subject: Re: [PATCH v1 4/4] tools: ivshmem-demo: Pass peer_id command line
To: Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20200527123225.31726-1-nikhil.nd@ti.com>
 <20200527123225.31726-5-nikhil.nd@ti.com>
 <98bf4c5b-9812-d2d4-8da0-c887b44277b9@siemens.com>
 <eb224001-86c9-593d-b4ab-d0ae168fcbd8@ti.com>
 <1d841e18-8a4e-0c00-4a57-1a74bb461fe6@siemens.com>
 <c32c3837-b0d6-c48e-221a-4202923d945f@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <08222d8d-39d1-1514-2259-891f95f20697@siemens.com>
Date: Wed, 27 May 2020 16:08:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <c32c3837-b0d6-c48e-221a-4202923d945f@ti.com>
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

On 27.05.20 15:53, Nikhil Devshatwar wrote:
>=20
>=20
> On 27/05/20 7:18 pm, Jan Kiszka wrote:
>> On 27.05.20 15:28, Nikhil Devshatwar wrote:
>>>
>>>
>>> On 27/05/20 6:41 pm, Jan Kiszka wrote:
>>>> On 27.05.20 14:32, nikhil.nd@ti.com wrote:
>>>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>>
>>>>> Number of peers available on a platform is different.
>>>>> Do not hard code the target peer_id used for interrupt.
>>>>> Parse this from the command line argument.
>>>>>
>>>>> This de-couples the dependency between number of peers.
>>>>> ivshmem-demo can be run to communicate with desired target
>>>>
>>>> No command line, please. We can do (<ID> + 1) % <Maximum Peers> as
>>>> target. All that is accessible via the register interface. But then al=
l
>>>
>>>
>>> I believe, as of now, only root cell can communicate with peer1, peer2,
>>> etc. Non root cells cannot communicate with each other.
>>> Please correct me if I am wrong.
>>>
>>
>> Not all targets have been enabled for the "triangle" setup, but if you
>> look at qemu-arm64, e.g., you can see that pattern.
>>
>>> (id + 1)% max_num_peers=C2=A0=C2=A0=C2=A0=C2=A0 logic won't work for a =
3peer scenario where
>>> root cell app(id=3D0) wants to communicate with baremetal(id=3D2)
>>> e.g. qemu-arm64 has these ids.
>>>
>>
>> Then we need to adjust that. It doesn't matter who sends whom, just
>> everyone should send something and everyone should receive something in
>> the end.
>>
>=20
> In QEMU, root (id =3D 0) linux-demo(id =3D 1) and baremetal(id =3D 2)
>=20
> 0 should be able to to 1 and 2
> Here you should choose if you want to communicate with baremetal or
> linux-demo. There is no way this can be automatically figured out.
> That's why I added an argument.

Every peer can talk to every other peer in those setups. It's just that
the demos are built in a way that each peer has a single notification
target, by convention, not by cell configuration.

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
jailhouse-dev/08222d8d-39d1-1514-2259-891f95f20697%40siemens.com.
