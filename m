Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBVGTT3UAKGQE5IYPLGY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id A20BC4862E
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 16:55:16 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id l53sf16737012edc.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 07:55:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560783316; cv=pass;
        d=google.com; s=arc-20160816;
        b=XK6OzthqduMOqQdKigZOlFtPwwZHvRJzr2bF7NsV/yJjhRffR80gw0QSFzedr3+RL1
         AZsl7PSjFV3IH376pbyFX97W2nnaUxQVz6XdT42ampLAXQmV1/aLrly418IejxM7LNZ1
         aqTY9cg0HkBPuDUZy9nsCTtvt1IjPwQear//OtPl5Vo/ORVZb4+resfsZnOYrvojbuKl
         cgSKEUdyMkhsnMtQ3a8p7m1S6G/30wLt4AN3tHSj2jxsFJhFhJNdjs2UX0bP7aIXnGM7
         X1EituQCqsJGUptCryP44fplq+wcqWYUbAVx6K2VISLy22Mx9uRELvb+hFRP00q5RSMY
         61Wg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=n4wHFXgawKJEgTtadW1bI9kHynnyL0VAK1t0xE8C2fo=;
        b=PtS5qYtuEoXCvd8TZ6ftp9sP+AGfV4+qOjHKpoQ9yWMFwcTIWVtrVPktJpD9x99atj
         mt1USrdrS/gEUwLr4tf1stFG+4rGbCX6NAvROVrCaHZzU2UiiFK4BOsF6c1sDv/bKPgK
         ayXAE4fofUBSTg5BLw83wy4n2bQGvaLl5wEhhwffucXnxhgOs5DvQZzEji84vO1KCTUe
         wbRrEGfsKOwee5MsP+NW1Tu109pchfk56SZOMQH7Pj3hcNqCMtikNxlOTVh5rSFVG5L+
         JqMKf7LBin5TLixJJAgI9Ip8cfnepq5FrvDcBSnZSsViWSK4lSbVtms5E1SePnY652Gb
         bXlw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=IUIi9uQN;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=n4wHFXgawKJEgTtadW1bI9kHynnyL0VAK1t0xE8C2fo=;
        b=XBra1pmeJTXzg3EdKNsG/J8pTcUNbFQvKBd/Rm7pfdkM+v3vRgLoII9fVrPIL++1U5
         AEUzfhWeEB2rYdSrkLSdloJ2J66P1dS9SokdGx2ynYGztws+amNdKyFLjGEeVvqfZ5xW
         TNk92v3zWdiKgTdF5vh7D1Rr6XxP8sQNwg6ESeecouFnkrllV4xh473czmYcGAxTgo2y
         ZVhIhnrzBVMFZL/1wwr6r5xG+k/xT80amhN2esp1Zb+7p091IN01TNtS8Z9O9bbguWMY
         d0rHwYjFMa+Q2Hhs77uBr/QK+0ZOH7pmVpk03WYLA30SJiFU5bzqKZeeaQebfnViy/98
         NOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=n4wHFXgawKJEgTtadW1bI9kHynnyL0VAK1t0xE8C2fo=;
        b=OXEgCvABe7DArGsdaJwF3lllXbgLPJwX8bCsMgokL+S6keytJ/8MaPgFtrBPbeyGN1
         q2GXPE6HY4U2JHFTDRhz/e6GzHHt04Mi/mplQjY1hnuPLYBwNo/Fp9s6sQJJpaUiW9V7
         MlrCScajN7RlP1RsfOGQankUZgLqW4knVjliE3TL+ya9WDYNkIbTbBDcVrji2qzwQiM2
         9286sh3NbfM034bpY0S9Tz1wsurZLZQDu21HkyLXO3e0YCFXGKAz28n/zsniZhJlHocK
         HdpPVrT1901eQP3f/lP1IBSEjvRZJ2Ng6vckFTMx1Jv10oaG2raOpYhe4yL6UpjGhuks
         Alkw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXczAsKcxnpf4dNRKgZSDoIAoC6LQSuZrGuAPs+kjAMsY2TNCLe
	A8aX9R7MmiPIWMAqXpIP9NU=
X-Google-Smtp-Source: APXvYqym99wXlsLzk4eP9pKwv7yfgpXy5NT+ntw46fwh2+O8+oAkTpyoT8cZvb7tzwqLDYeOj1+Wng==
X-Received: by 2002:a50:8b9c:: with SMTP id m28mr75826409edm.53.1560783316434;
        Mon, 17 Jun 2019 07:55:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:35c5:: with SMTP id p5ls3931444ejb.9.gmail; Mon, 17
 Jun 2019 07:55:15 -0700 (PDT)
X-Received: by 2002:a17:906:4e92:: with SMTP id v18mr40634628eju.57.1560783315933;
        Mon, 17 Jun 2019 07:55:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560783315; cv=none;
        d=google.com; s=arc-20160816;
        b=cFy5qHKm99YtLoHzyAdXDbE7bWm3B3SUPGDf53RkP8vF9kG6MNnB29K0R/SHRddnwO
         MuJhvMzX0I8TjZZLzPtQX4ElAbnNd7IaqBP8Nh+JtUvQsCW4IfOPVv5XXV5D6mgxptVI
         Jegmz9kZLmikykIOssEkF+yMlgDfpXftAMo5nyYjf9QWAIjtqT+plCYuSLVEFIz91/Cq
         nCLuUabnpD0rNWbysxIq8VVV2+0nY95MUGJzsQIAboZAmYbLR6ehJDSfxDyP10lciXpB
         lut3zJIU6cyZCvsSS34WgYkk+272ccbCqKOijsXJ7OTFuxiJYkyAhh0b7Zc1/pyslIpn
         lxOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=EnsEoNvV/F5ngTVIzyIIBbCkWDrv0oH/opMlaSUBzT8=;
        b=kOiTrd85LT6c7y5JOZyguYYzDCxrzZ+z+jl57pckrOMibiQQ0CQXus/vP9bOjmbLY0
         THdC3gsGXcZaB1pMFxCJZPuZY3iB4IlLbh5aYY5X5fzOS4zfSTjbwMFJ37HbEudJ2v7J
         7sGEvhNcjfeaj9KvnSIXSmdjm4UojxdalcTQuySB6cFhKnlbfH8jzhvymLDSBmN6GKe5
         hOQy/ETSJoZ5ju7t2yJ8ce5VIfhb2M2ucyeMZx3F7x4ilPXxD+mHjE7xnjgQyOOIc1+X
         s5LcA2ZDiIi7mEJBCnT4BdVGb/XjJlytbxiTiYmSCQIsVbI8cwS7MdAr3MntirZJzCvz
         WUYw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=IUIi9uQN;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id gw3si49922ejb.0.2019.06.17.07.55.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 07:55:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45SDll3bs8zyH8;
	Mon, 17 Jun 2019 16:55:15 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 17 Jun
 2019 16:55:15 +0200
Subject: Re: [PATCH 2/2] x86: vtd: Limit index of vtd_update_irte to 16 bits
To: Jan Kiszka <jan.kiszka@siemens.com>, Mario Mintel
	<mario.mintel@st.oth-regensburg.de>, <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <20190617131321.8585-1-mario.mintel@st.oth-regensburg.de>
 <20190617131321.8585-2-mario.mintel@st.oth-regensburg.de>
 <099b48da-a1af-a420-ab61-f8da99ec5c5d@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <55662300-f216-0e53-be0a-0860d3505eb4@oth-regensburg.de>
Date: Mon, 17 Jun 2019 16:55:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <099b48da-a1af-a420-ab61-f8da99ec5c5d@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=IUIi9uQN;
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



On 6/17/19 4:51 PM, Jan Kiszka wrote:
> On 17.06.19 15:13, Mario Mintel wrote:
>> See Intels VT-d Architectures Specification, chapter 5.1.3:
>> "Maximum number of IRTEs in an Interrupt Remapping Table is 64K."
>>
>> Hence the max numbers of IRTEs is 65535 so we can limit the index to 16
>> bits.
>>
>> Signed-off-by: Mario Mintel <mario.mintel@st.oth-regensburg.de>
>> ---
>> =C2=A0 hypervisor/arch/x86/vtd.c | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
>> index 8e076b4b..d0dd4fd8 100644
>> --- a/hypervisor/arch/x86/vtd.c
>> +++ b/hypervisor/arch/x86/vtd.c
>> @@ -556,7 +556,7 @@ static void vtd_init_unit(void *reg_base, void
>> *inv_queue)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vtd_update_gcmd_reg(reg_base, VTD_GCMD_IR=
E, 1);
>> =C2=A0 }
>> =C2=A0 -static void vtd_update_irte(unsigned int index, union vtd_irte
>> content)
>> +static void vtd_update_irte(u16 index, union vtd_irte content)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct vtd_entry inv_int =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .lo_word =3D VTD_=
REQ_INV_INT | VTD_INV_INT_INDEX |
>>
>=20
> I don't see the value of this change, though. Actually, doesn't the
> compiler even bark at us then when passing in a wider type (which we do
> so far)?

ATM, everything is fine with the code. But as soon as we would pass
anything wider than 16 bit, we would get a proper warning with this
patch. There's no reason why index should be 32 bit wide.

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
jailhouse-dev/55662300-f216-0e53-be0a-0860d3505eb4%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
