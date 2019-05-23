Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBOHNTDTQKGQERNJRL3I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 263DC275D3
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2019 07:59:21 +0200 (CEST)
Received: by mail-ed1-x540.google.com with SMTP id 18sf7360972eds.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 May 2019 22:59:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558591161; cv=pass;
        d=google.com; s=arc-20160816;
        b=RklrHexRXG6Axn0FVDogk88zymtvskSaT9FciVoIhyfj/qZgVunakVCV0z8BmoofCX
         OytF5+KBOaAqlq/1Z9n6NOundENFj4TejOfiGcKcbfmRymJp/ODNutBWJ67Od5GqcRlT
         4JVW6N36Qn+kDoUYqkDzqRFQ2EktLxXSs3KxkxThetXjhr4PazXOLVY9xy2f8IHI+3+t
         aPFRZ9oaiNgX2XO+rEkUo6FgJlxP+PLvGqLzzdo8Esz0kUBNNByjKX1URNNwHYbrshYP
         Jny3CsvaHrpxK02DYEgAKi0u3y+DggRAnfwIPgfjLYNzehTbmr45eSfnZjaJUyRRZWIH
         fIqg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:openpgp:from:references:to:subject:sender
         :dkim-signature;
        bh=3U1PyC/R+/ybZ0FlOUO2t4nPDxuhC5OaDptzb+eamgs=;
        b=vWrn493Q5tHpA1KnoZ8HPcqLiT62ImP/650vBbzVTrjzdc1ZzmLGrzYkGAMCnFcA2S
         SZS4f+kUd6S5JI3maWYiQRP/PttZydIaYUioXvonXDWcKOPgUWodsYf1LyCUi9y5XFTK
         h4lnLVwq5w05mFceF4whTcMqoou5y45htPvDrh3knzdu4jE6kuJCLxITSqUyO9x5pR6q
         Rqovaaac+NoXbuJqkqlLg+xaZavMarbY+VmdovDDmFzuRuLn61FUlExh6HE/hzHi/wmC
         s3SXstvWUazyZ3OQxrQ2KzS2dARjXgf4LYcjk6wqdtkPTx7XsYwmNvD9FLT3wwW7hTBe
         Rdkg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=btYH8fk0;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3U1PyC/R+/ybZ0FlOUO2t4nPDxuhC5OaDptzb+eamgs=;
        b=Uur8s793lEfjzcyNoKaPhh5JN/6F/Fe7rpFBXmE7rrl/Su7avDRptc9siKYCs/raq8
         5HGx9taxTfTvBXguPKUvMvb2ujWHwKWQXrmsdRjGfJTXOxcYu1sPLaJmt7EG96ZJk4C9
         IUaYAf7xkE0HucPFM7WElDWG5FE63Jb6yXa5M3GtrZ2IGUO7VIcjmm8j9gVCLfm134Tn
         xBcRrzGg0m22mHxM1vLh82kW+pOM4lBh/kto3jiD1d7ADeViZtTLf97ZRGNTL4LaocPG
         mnGwpaMP6LdGV4Sn5UO3wHSlIiJuQqbyzahjHJkCpN6HPQl1rvvtK2pXq5+1lEpmvqD/
         vi1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3U1PyC/R+/ybZ0FlOUO2t4nPDxuhC5OaDptzb+eamgs=;
        b=YN0Lo0ZRicS2XECtP1itlFPbIrEiGGr8DGcAwIM4QQVifEttOT3riYLgItdDNQPVPr
         63COWHGBATHnHSdsSou+fjCWJ32stjcmwUw8kRzgKOj/XwXkcbESF+6EtGoWjf/cn+5q
         dQ5mnQJfffagH+vUr46d1vwQCRTuxGE/CiMfC1zSqCCv89VzMzpu8r9UUNqFhg6zbLrZ
         sgHVshSGPjg6He0rumaKgjWMPmPHnTV/+9Hg2uSVBjmbSi8z+1fTpNeYxAr04vQ9J9MB
         0zU4D/o8JcetoZrH44ZmoGV/U7iWTmGMMqZYK/1Hlii0bipc8cn0aL2CXuKB4z0HzucS
         9vsQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVfg4LaWtxT+m3R7PspMogYLuen6qQ/lmFOLzpXIZZcmy0togWw
	qmppf03MXZ+/TQAWbBapY8s=
X-Google-Smtp-Source: APXvYqxJeWDWJ4pVXIeWFFfMXv/0EVQa80RNTlrhHwuOOkEE7/OI+GCQcrpsjD9kQ/DREVydUE98+w==
X-Received: by 2002:aa7:d04e:: with SMTP id n14mr65222791edo.205.1558591160895;
        Wed, 22 May 2019 22:59:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:91a7:: with SMTP id g36ls1292256eda.4.gmail; Wed, 22 May
 2019 22:59:20 -0700 (PDT)
X-Received: by 2002:a50:b535:: with SMTP id y50mr333441edd.89.1558591160340;
        Wed, 22 May 2019 22:59:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558591160; cv=none;
        d=google.com; s=arc-20160816;
        b=N+o64HEqWnTGd6pNJoR/vXoPHtrss/MDFhHE/IoPaHrnyLcwOUu6aQ40SysfGdUbOh
         Heb2Rs0XSFFUTbqLoY8DdZyvsJgUAmfdmVLAhBsJjlkSVh5yJWKdDunLeKNtycygcjoj
         a4REPiwv6Ni7GaKAZoOGa23sUpccADI2vxjZfARdLsp8YRDoCen19ZjftaT1pm+4dGTU
         3cvBzxcSswkL0C/ku46KwZ9TDabkJGrvtWpP+0Z8k6/h0e9HC3p2wXd1AbpmU5dEo0Ju
         k5ltLHeaTuG7w3DZdd+9SxCwmgRud8gUvAa95D83GrxFkPYfrfz80CF9CIM4OfYg8Nas
         KqaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :subject:dkim-signature;
        bh=N1zRe81BcC6wqHUkNBi1Ia+Sd11F8w1G/Bnr3siJMaU=;
        b=ivjyp5dxrdz5BEgjU25k2Ps96zhjtLDWY0FWnrampaE2AEpJdg/6cuW4xYwh6oto37
         OHOstbkDObcKeRSEdaPN/DHAhdLQceaCSSotIdTi+w5lO0HqTT9TsGP4Ud7ivkz5waim
         Ng0IJWjdwPw9a5w8D2RE9b8YBXHN0JTcVFL5pZpl4epjf0pDSPRBsgkAGjUqXQgk80vx
         qUpr2YXsdVqQDwO6xZz9XCUXy7kIZIrKOCq/snsfgzNURgmengl03lcmTGFMZnG1bBUT
         QjOTOX4kWt1//TePdPfN+qTUW5xNE9jnQU6r3RO8ggsDe7im9Ed9CQE7U1EruJFwaCqB
         j4ZQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=btYH8fk0;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id j5si1029809ejm.1.2019.05.22.22.59.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2019 22:59:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 458f2v5H2qzyHb;
	Thu, 23 May 2019 07:59:19 +0200 (CEST)
Received: from [IPv6:2a01:598:b00d:bfbe:70ee:7d59:5e80:4afe]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 23 May
 2019 07:59:19 +0200
Subject: Re: Unsupported DMAR Device Scope Structure
To: Jan Kiszka <jan.kiszka@web.de>, <jeanne.romefort@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>, Mario Mintel
	<mario.mintel@st.oth-regensburg.de>
References: <edd9ef72-beae-42c3-94c7-ac5bf29ba57d@googlegroups.com>
 <594f54f4-eb5c-5b64-2d49-38997bcf2f8b@siemens.com>
 <50b964d8-41e5-49af-96dc-3080cbd3966e@googlegroups.com>
 <62d847c0-b4b6-4395-b603-ecf2f87095d7@googlegroups.com>
 <3bcebf94-23a5-18d3-1f0b-bb25717167a3@siemens.com>
 <c238d436-5995-4c44-8a19-bc26654671d5@googlegroups.com>
 <5c94104f-c27d-9074-1990-61fa9e9d05c1@siemens.com>
 <cda9daa8-fbe8-46fb-aaba-75ebd38e141e@googlegroups.com>
 <71f64f49-1bcd-4ab0-947a-0bcabc2ac1e6@googlegroups.com>
 <02568569-7d1b-4bb5-8a1e-a5cbee5a77ee@googlegroups.com>
 <b68c813d-2949-4516-bfa3-2fb4828cee9e@googlegroups.com>
 <63282997-5d5a-4c59-9d60-1d73fcfe49db@googlegroups.com>
 <0f2b55b7-09ea-4158-913b-4ec20c7443d9@googlegroups.com>
 <8667152c-c459-997e-42d7-0f908418be0e@web.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <1300fb12-e2eb-1a10-e950-9f7c94e1071b@oth-regensburg.de>
Date: Thu, 23 May 2019 07:59:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <8667152c-c459-997e-42d7-0f908418be0e@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=btYH8fk0;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Hi all,

On 5/12/19 9:51 AM, Jan Kiszka wrote:
> On 10.05.19 15:11, jeanne.romefort@gmail.com wrote:
>> Hello everyone,
>>
>> I'm still trying to get my rootCell running. I have for the moment
>> connected a serial port in order to have the logs in full (in ssh the
>> communication was down before I could have the logs). After solving
>> some minor errors (such as Invalid MMIO/RAM read or IO-port) I find
>> myself with an error that I can't explain:
>>
>>
>> VT-d fault event reported by IOMMU 1:
>> =C2=A0 Source Identifier (bus:dev.func): 03:00.0
>> =C2=A0 Fault Reason: 0x22 Fault Info: 38000000000 Type 0
>> VT-d fault event reported by IOMMU 1:
>> =C2=A0 Source Identifier (bus:dev.func): 03:00.0
>> =C2=A0 Fault Reason: 0x22 Fault Info: 3c000000000 Type 0
>> VT-d fault event reported by IOMMU 1:
>> =C2=A0 Source Identifier (bus:dev.func): 03:00.0
>> =C2=A0 Fault Reason: 0x22 Fault Info: 39000000000 Type 0
>> VT-d fault event reported by IOMMU 1:
>> =C2=A0 Source Identifier (bus:dev.func): 03:00.0
>> =C2=A0 Fault Reason: 0x22 Fault Info: 3b000000000 Type 0

hmm, sounds familiar.

On a Dell T440, we have the *exact* same issue with a similar card: a
BCM5720, pretty similar to your BCM5719. See my thread "VT-d: IOMMU
exception with unknown fault reason"). And yes, there we have an active
link on it.

>>
>>
>> Is the new sysfs-parser.py the cause of my trouble or is there
>> anything I missed in the configuration ?
>=20
> Could be. 0x22 means that the device is not present in the interrupt

We have no modifications of the sysfs parser and face the same issue.

> remapping
> table of IOMMU that is responsible for that device. Try changing the .iom=
mu
> number for that device from 0 to 1 or the other way around. Or is there
> no entry
> for 03:00.0 at all?

Jeanne, were you already able to solve this issue?

I manually parsed (my) DMAR, and there's a ATSR structure (type 0x2)
which is ignored by the config parser. Could this be related to this
issue or can it simply be ignored?

In this system, we have four iommus. Mario, did you already test all
possibilities for .iommu (0, 1, 2, 3)?

  Ralf

>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1300fb12-e2eb-1a10-e950-9f7c94e1071b%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
