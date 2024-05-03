Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBXUG2SYQMGQELJEACXY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1498BAFD6
	for <lists+jailhouse-dev@lfdr.de>; Fri,  3 May 2024 17:31:45 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id 5b1f17b1804b1-41aa1bbddadsf37120575e9.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 03 May 2024 08:31:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1714750305; cv=pass;
        d=google.com; s=arc-20160816;
        b=cHYjedDZn8Qb0eFciUtRwMbh+K32Xu0r5mNHFwXV8KGVx4Whkkup6Cxc4pG4AKDLlP
         76mYz9ltsERQIuK04iWw4GxxajArNS/aV3IZFFZg/ve3iAqc+jh1c6SdlX+D9b/YvWvy
         pTeBqOWDOJ97iXxZ8oL/L4wFXma8hTkNC7lZ00VYPpikya0Tn2TFY9nQ90KjKV3L6zCB
         qllBlkOVNlo4Q6flpprU3FzpQCE1PqjFy40vRi/Uyr+D0VHXn0FkCphSWySuiv70XyCZ
         g2Vbx7uMQWwBlnY1c0etBK6WduaPESHU1Em+gutVhxkY8sByFLbJmDV55dv8yJG4nPuo
         WvYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:sender:dkim-signature;
        bh=OZQUe88/pPVy7Z95KEvcRl7KGrMOFrtg/tLqEr+dOUE=;
        fh=ScihRJmRCzZqH296MDsPHTdhUr+OALcfg60tAaZN2QY=;
        b=Hp8m0B73jDGB51Oc7fDwfsJLIPX3PsPBURHa0A7Iy9dj9u4MtIyOEi8yROEpWODlzH
         1PIxikx6kUaJuRz2h6OlwPW9JwMKeg2DBulfQpZmkP+P8T06mp2o4w9oQcrQ7Brz8pAM
         a6atKu/K5VyFCyoY6IATOzELfSOV2LBfzXUvl6tisMlOHnuG9o4kheDowBEPbRYBpYrR
         YOwA8drCD4IsCCB6XgJy/FU01MDbJ9XOmA+CzMUjIZhIfKKqcxMwezanjeGcB47RFjv9
         G8j9xFIaZXNV1vCL9S3w90IJRc4eZj2pltLMOYpmdHpQIR7LUG9XDE/ycZPcxhi8GLeT
         2xnw==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=QNRSa8SC;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1714750305; x=1715355105; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZQUe88/pPVy7Z95KEvcRl7KGrMOFrtg/tLqEr+dOUE=;
        b=eHbfKPe15sMlkdagzuxBHXjo43Zr3Jbw7gJnhGnBOjp5yrP3YkuH5GldQdwLF6Td64
         37GgVV4uSO6etpGfayLdl3M6hSikGksS430eI31mWlEbWJrhUEevWp433Y3zegJmagyj
         095cY8zMHppaEYGWKNMJ/9valAt0LXT0zawqu0+bPQN/ssEYZQiktYDVQaRH39UE0LUf
         FnO1FzHApqoJZk0ZVgfyEzXSS/BFNCto3uUJeMUsbCA85DjqEV+gmrciTBl9E4OquoGD
         EAW9Gatsc9K/AjDZV006ZSE+P6cohVXCkycsPlQ7Fg1o0PQX+5NgccY1Mbh/RqpYM/ck
         O5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714750305; x=1715355105;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZQUe88/pPVy7Z95KEvcRl7KGrMOFrtg/tLqEr+dOUE=;
        b=X//ZAxl11uQjR0KhWC9TQCe9ToCU4tmtNmhlU1+rz5ue7jII96P+Kp+wmJTnvxaiGd
         DVHyctrE9yPX2lfDWjpBHp6EFyZAAAyz7zJdf5JftvWRhwkJXIaAbLgrcQtSbBDRjIno
         eQU+1T245c53cf/8JYyt3VW3o50D4ps0PQEVFkj/AqoFAbJg/HwvF1JKVOPLJy0zUR1F
         IqV0ubChuzpZIereTeIXtKCdLgmX1vtn1wSqZCPHw6cfEO95iOcPBSZEP6L8eJnri4NS
         FMUtNpSZRSYgNgq7TGSokZFNQYAt1oRLokE3Gj2fjrUFm5UqTM761+ScnxFLBYF2JQdD
         xdsg==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=2; AJvYcCVWi0PX0twn0WcTOmgIRubkRIltNyHCW8vJS3aZ8JgUhl47844tSLByIPE4cUL7lzkKHt0n6YqKqty4jCpd6/5kmJhbu259Gvxmops=
X-Gm-Message-State: AOJu0YxMwTW6Ug0D4KXBtkddRnni++Lcdy4rdZXSJAUWLouEepKuYnri
	qHJUyn3+QJaDD5t+ZgPHmBR4F3+P1ZO+IMD1tp0My3+xitFTBOuR
X-Google-Smtp-Source: AGHT+IFrVrtO9y3qN4SesWnSP0RfiPQAggXmuOCPzlJn9ExykxrrE3qPKSM3sOR7KyNPP6geVcS4ag==
X-Received: by 2002:a05:600c:1d0a:b0:41c:2699:dd9d with SMTP id l10-20020a05600c1d0a00b0041c2699dd9dmr2707805wms.28.1714750303478;
        Fri, 03 May 2024 08:31:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:3596:b0:419:f157:22f7 with SMTP id
 5b1f17b1804b1-41dc74cd012ls8174065e9.2.-pod-prod-08-eu; Fri, 03 May 2024
 08:31:40 -0700 (PDT)
X-Received: by 2002:a05:600c:3ba2:b0:41a:8b39:8040 with SMTP id n34-20020a05600c3ba200b0041a8b398040mr2582798wms.20.1714750300425;
        Fri, 03 May 2024 08:31:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714750300; cv=none;
        d=google.com; s=arc-20160816;
        b=asuGlu3jCA1ZtLlhMCVDZ9/jpyzacspP48+zjCTYs4UjkHuaL8xXwEQU0s3PKB93lf
         FrE5TW+Rn6O7u6D03P/WxZNIZ1CPUZ6ai+RFy97CJYjcIe/xPqtAq5f53RAYeqAOp1xJ
         pSq9LqRrDgPWtm1vSpFU85ADm3IlxSnlef7TYRFdgmJ2hdCQ6Rj4goGlfCw/HyPHG8lX
         4jZ5pHTZwVyhkgqNVz5SUnOxAhF57VXl68pZi9onwgI9ClDZbrCdfPo9W21yO+3UznjW
         wFeFHlS8SSUrrbZzKW54zR/2bVAC6UC2fIed+WfCvfdRL1eK0KXPES66rizECByStfpc
         pJIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=gMPUkpOir1oQlH3Oes3hkwmMusA2RQRcPYgbzv+LAec=;
        fh=ojbGzYkUnsKSceBWiJLicxP+3aT9fm+GqlTR/JKzW0E=;
        b=AMdaej0gX9OdA9WD21aOJN5NBk4c7BQJUTZbTGMQFI9mN3GX1ObVwPOQrqXbAzibdN
         wxQAc8+OU80TG8/2biTaZN7IYQ89R3PPp3qWgOCgfXXKfdsFNOBRBCgHUZ7N4fUN23EJ
         a6UPUBGkkPpw7lTbu1SC/FGHkqgxJOsvIghh3TNq7N6tZYxAsP+95Xw+mWC88I8MJz5k
         jLfVwJ0BHDummmSgfpRTVtg4asTUF4c0vn38YExC5MsJn5x/TJ9B46khbHQQK0/kcmGJ
         x44dRx6xGJMgQfMH2HLyiUVgCZcIqJXCOsk4MiJmmN+LlKrkAdmEE0qmLl6SD2VFe9Ym
         Jf2w==;
        dara=google.com
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=QNRSa8SC;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from a2752.mx.srv.dfn.de (a2752.mx.srv.dfn.de. [2001:638:d:c301:acdc:1979:2:f4])
        by gmr-mx.google.com with ESMTPS id p16-20020a05600c469000b0041a3b6eb6b7si849375wmo.0.2024.05.03.08.31.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 08:31:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) client-ip=2001:638:d:c301:acdc:1979:2:f4;
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de [IPv6:2001:638:a01:1096::12])
	by a2752.mx.srv.dfn.de (Postfix) with ESMTPS id 8E0EC2E01BC;
	Fri,  3 May 2024 17:31:39 +0200 (CEST)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4VWFCG5PMQzy37;
	Fri,  3 May 2024 17:31:38 +0200 (CEST)
Received: from [172.16.2.23] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 3 May
 2024 17:31:38 +0200
Message-ID: <d30a9764-585f-4189-9f0c-033ddc2e1e55@oth-regensburg.de>
Date: Fri, 3 May 2024 17:31:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: Direct Interrupt Injection for x86
To: Syed Aftab Rashid <saftab.rashid@gmail.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
References: <1e39fb3a-f017-480d-aef7-2522a4735df0n@googlegroups.com>
 <3c397a1f-0ad9-46c9-a59a-021691b2b77c@oth-regensburg.de>
 <CAJtpjXjtf3vv-AAyXPQgt7P67r304skMUsmL+cusvkPNVS_LiA@mail.gmail.com>
 <72441d4a-85fa-4fb2-9fcb-7495852ff564@oth-regensburg.de>
 <CAJtpjXj7=La=WUJJ9BgY6K7OYVCoBEBwkxq9hDtA5+6De2mYEg@mail.gmail.com>
 <02e40eed-4a63-40c6-b103-2433964ca130@oth-regensburg.de>
 <CAJtpjXggv_tL59_Uh3oS0bAiJPGMoreUdozU6qkWtAqdg5j8VA@mail.gmail.com>
 <dc8df30b-6a23-4954-a0de-fb2077074e23@oth-regensburg.de>
 <CAJtpjXjN3MfvfJhGf8k=Dx08XoVx--bAkKqgOVDN2Jqz_OBR9w@mail.gmail.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Content-Language: en-US
In-Reply-To: <CAJtpjXjN3MfvfJhGf8k=Dx08XoVx--bAkKqgOVDN2Jqz_OBR9w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=QNRSa8SC;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender)
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

Hi,

On 02/05/2024 15:45, Syed Aftab Rashid wrote:

[snip]

>      > I just wanted to understand what is the best possible jitter that
>     I can
>      > get with Jailhouse. We are working on a project that needs cycle
>     times
>      > between 1-2=C2=A0 microseconds. The bare metal implementation of a
>     similar
>      > application results in a much lower jitter ~50ns.
>=20
>     So the application does structurally the same like apic-demo?
>     (i.e., full IRQ arrival and dispatching, "computational task" (i.e.,
>     calculating jitter), return). 50ns are ~100 TSC cycles =E2=80=93 athl=
etic.
>=20
>     I really doubt those latencies are achievable with IRQs. With active
>     waiting for events (i.e., active polling for interruption) - maybe.
>=20
>=20
> Yes, it is a similar application implemented in bare metal code directly=
=20
> on the hardware. The jitter is even smaller with the max being 30ns.

Interesting. W/o having the possibility to have a close look at this=20
issue, I'd say that this comes from the additional need of hardware=20
lookups through IRQ rerouting tables. I cannot say.

[snip]

>      > apic-demo doesn't seem to have much impact on the jitter. How is
>     cache
>      > allocated under Jailhouse house? What does a cache allocation of
>     size 2
>      > employ?
>=20
>     Cache allocation is only supported on Intel X86, where we have CAT,
>     cache allocation technology.
>=20
>     I don't know precise details of cat (would have to look them up),
>     but as
>     far as I remember, assigning a size of 2 to a non-root-cell means tha=
t
>     2MiB of L3$ are exclusively assigned to the non-root cell. (Look at t=
he
>     code, I'm not 100% sure).
>=20
>     Why do we do that? Neighbouring noise from other cells.
>=20
>     Just like the non-root cell might "disturb" itself, it's also possibl=
e
>     that Linux, running aside of the non-root cell disturbes it: Imagine
>     Linux those heavy number crunching while the non-root cell waits for =
an
>     IRQ. In that case, Linux will mess up caches of the non-root cell.
>=20
>     CAT prevents full cache pollution by ensuring that there is always a
>     dedicated, but limited, amount of L3$ for the non-root cell.
>=20
>=20
> Thanks for the explanation, I understand the idea of cache pollution. It=
=20
> is just that I don't see much impact with or without cache pollution on=
=20
> the values I get for the jitter. Ideally, the jitter should be higher if=
=20
> I enable cache pollution and lower when I disable it. But, so far I am=20
> not able to see that.
>=20
> Also, another question regarding direct interrupt injection, as we saw=20
> that it is enabled by default. Can you tell me how can I disable it?=20
> Again, this is just to see how it will impact the jitter if we have=20
> direct interrupt injection disabled.

There's no actual support for disabling this, it's used when being=20
available. When Jailhouse tries to query the capability of IRQ remapping=20
support during startup, you will have to mask out the bits that show=20
support for it. I guess that should work.

   Ralf

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/d30a9764-585f-4189-9f0c-033ddc2e1e55%40oth-regensburg.de.
