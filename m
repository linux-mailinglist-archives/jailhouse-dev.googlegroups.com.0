Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB7XQT3UAKGQEWWSQXJQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCBA4880F
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 17:57:51 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id r4sf4857026wrt.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 08:57:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560787071; cv=pass;
        d=google.com; s=arc-20160816;
        b=YrDBh82KbFuK4l8UDVBnnNoJyJhA4+MnediCT3HWiXtQAJ2vQucTI7CUrdq0zdMmKT
         4YnnvlOyLQfbSz6DZqwKzsHb6GFaU01dEsV/4blSZInNd3zd8kiLVaTIHY8glxOlMYp/
         /tIYQUO1LGBQG9ySRfUOFR7AOtWwFIPO5/DyqRr3AeplgmFkh7OVeTY7FcB4FZ5qBEvd
         L+8ZwS18E11pWGm+Z51DLesrF2CxInZmjaB3Cw997GWL1AAg+0FuKP86H9M1dyYISrZ7
         vhUG354sr+dS3bsC4dYzfL4pJsE4c0tj2TX1cCdIwhXN3rXFLE3tbc62i9VCUiWQLs2c
         eq8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=Afp/w4G6WeNKtKtci3GfDAnVYqRCU699GQDBAL6OIMQ=;
        b=JI4S97MNKZL0YjdsnnkxOHEB+wB9vgbLlAHYCMAOLNnGd/dizgN1660epf52re8Pow
         q6MBexIULjSRr5zR/EO2edoRYzxeyAmQScHi5YQWwqZw77HwPJQo+3zz04oRt5oDWJPM
         W0oR8X28HtgQLZuuQWpXxtBPdAhngaLqqEawVPghfxAWLwWcqZMkO+E03ZT7c0WJoUri
         w/VoQNh8+y2sA6wmWVeYJr/JA88/NHVwTFLUG3mDdUriYIHN6r4zZok5gDzYuP0YnX3d
         KJ6w5sbq9HHDinaI3YbIGE9lQErwK170U8f7LWxrJWn4U88Zh9niyAhYizyI08p2JeN7
         nXSg==
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
        bh=Afp/w4G6WeNKtKtci3GfDAnVYqRCU699GQDBAL6OIMQ=;
        b=PG3BxE/KbF7SLgCHq5Mz6NEY/HFpkkOlu/bElwG9eyrAQM9CkHXi2CVUhEywuBMhkN
         muY11EIzjA5efGux2hkg+uidwl9TzgKLjNT2AwAP/wnuBoDriCRgVIkC2Fj7Bi84tPKM
         5aesolJmGaFiQhl19se64yb/mnJao7lyARddAZJtdM3Wnju5X49FTBeLQ7UF0crCvQpH
         wt9JqFVtfrdG7m0XjiLZVg2RmqNqJn0b/h+6Lt8lu8TfVnxzP5P4C2THyKEebI/ZezDW
         PisdWXMTemwsvVjLMYzco6FCcrS8HNxqqIQpZTxSRXZmnl/xQ+wZ8tmwQv5L9g1LLvgA
         BT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Afp/w4G6WeNKtKtci3GfDAnVYqRCU699GQDBAL6OIMQ=;
        b=HIVVQp0JgQ25JjHrWbzTjA6W6Uqri77FTdpHy8UUhvPGamiRs/FjSKXBV3fFT6u1aO
         fl69H/yrm2xpp/LLv5okUiiGKKHuJ7nD4sNz27WvYPHbyhO3WQqDHFqbMGnuikD/Q38X
         ShIfG5kLI8oMfNGuj6KsXLR7xG78qZ0O65d3U9DAXXdFEKpqH9kEHcbxbsiFrFVgcupL
         IUnM0A2ghSP2+tCAZtLwBg8Y2DoKND9+egTdsGFbg0auKPjI2g975Gge8qblbQT9We7n
         xy2mQKm0Hgci7FlSvNs+kR39SyGNah7d4GVd2gIT490zuTYi361ykaTDuInoeUWQA/vy
         mGUw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUxpldS1c+mmkPOzaxYDDWEDC6vTi7cyS+Y7Q//lDn15hPeHNU5
	zi8vik+QnLKMPGs8HihikEs=
X-Google-Smtp-Source: APXvYqxqGD1D9/pqnosIU2zw7uo5yjdZaXZwc7BGPTnJk+mF6tc1aTW5hojyfXh5jpw3D3pbr5GRYw==
X-Received: by 2002:a1c:4f:: with SMTP id 76mr7433093wma.130.1560787071043;
        Mon, 17 Jun 2019 08:57:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:edce:: with SMTP id v14ls4046077wro.4.gmail; Mon, 17 Jun
 2019 08:57:50 -0700 (PDT)
X-Received: by 2002:adf:e50c:: with SMTP id j12mr22629478wrm.117.1560787070449;
        Mon, 17 Jun 2019 08:57:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560787070; cv=none;
        d=google.com; s=arc-20160816;
        b=CXpmagqUZdnukL4DRN62sx8oh9tqYeii0D1iQkqwgpn9j1bjCtHWBSqSXtVPEYAulJ
         JKR98xytir6zKrTr7/RQROFCGB2hV1ePEaw4b095v6nsn0ZVAhdo4JqfLw+d3QgjEdri
         U56X8f1UrDSqN3P6gbbZHmYBadhsBZGSbUz/P8RAW52kUN1Tll0kEo0PUy3kPIc3KrrE
         oIKiOciemA0nzjfnGROR4xnriKZSGjYTWCV7tUwsvaqGm+JwdMFypzItTG+YkGDBj1S8
         p7inMttvazlVOCn9Ubzvh5wyTtOT/FB6fG7ORnfIPvsmgHmwGGtQnZb/Kz3X7MAslGqe
         kMyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=3TqttxfPqhOF0b7KYbJW1MgL+RtvoogOqicWR7XaJ7w=;
        b=Hgo9bn754Kg6Atm038LZ01XOYtxUrcWx84pSk1SG+KxV2iC2o8ut7C06VCQ8gGdemx
         +05X2AXbGF/Xf7EH4YKe8YGF28sJYdPfffZuxxs/HNZhEH9i/WJ1EcN9CnvY7+zneeh2
         i0g2Iq7QWgF6IkqPHnmDGX6ADTCDmnYIsgSUvTK3Nj8r/h7KKPHYDnXV5Egh485tF4nn
         6QAnSF8L5Ct5JR64imGklVSh2/5CHeDHDIxzkiotMreqAfpvqimx1tmtCv6/YaqgZz0a
         AURj05uuaRErRd2ils/AkMNvMbzic4vLCoyQUK6hcDYzy4230go4qR+/1miwcRVtZCKd
         OKcA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id j18si490847wrc.1.2019.06.17.08.57.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 08:57:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x5HFvoOM024361
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Jun 2019 17:57:50 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5HFvnGV029219;
	Mon, 17 Jun 2019 17:57:49 +0200
Subject: Re: [PATCH 2/2] x86: vtd: Limit index of vtd_update_irte to 16 bits
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Mario Mintel <mario.mintel@st.oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <20190617131321.8585-1-mario.mintel@st.oth-regensburg.de>
 <20190617131321.8585-2-mario.mintel@st.oth-regensburg.de>
 <099b48da-a1af-a420-ab61-f8da99ec5c5d@siemens.com>
 <55662300-f216-0e53-be0a-0860d3505eb4@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b19a1a1a-c956-91de-03a8-03afe327389b@siemens.com>
Date: Mon, 17 Jun 2019 17:57:49 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <55662300-f216-0e53-be0a-0860d3505eb4@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 17.06.19 16:55, Ralf Ramsauer wrote:
> On 6/17/19 4:51 PM, Jan Kiszka wrote:
>> On 17.06.19 15:13, Mario Mintel wrote:
>>> See Intels VT-d Architectures Specification, chapter 5.1.3:
>>> "Maximum number of IRTEs in an Interrupt Remapping Table is 64K."
>>>
>>> Hence the max numbers of IRTEs is 65535 so we can limit the index to 16
>>> bits.
>>>
>>> Signed-off-by: Mario Mintel <mario.mintel@st.oth-regensburg.de>
>>> ---
>>>  =C2=A0 hypervisor/arch/x86/vtd.c | 2 +-
>>>  =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
>>> index 8e076b4b..d0dd4fd8 100644
>>> --- a/hypervisor/arch/x86/vtd.c
>>> +++ b/hypervisor/arch/x86/vtd.c
>>> @@ -556,7 +556,7 @@ static void vtd_init_unit(void *reg_base, void
>>> *inv_queue)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vtd_update_gcmd_reg(reg_base, VTD_GCMD_=
IRE, 1);
>>>  =C2=A0 }
>>>  =C2=A0 -static void vtd_update_irte(unsigned int index, union vtd_irte
>>> content)
>>> +static void vtd_update_irte(u16 index, union vtd_irte content)
>>>  =C2=A0 {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct vtd_entry inv_int =3D {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .lo_word =3D VT=
D_REQ_INV_INT | VTD_INV_INT_INDEX |
>>>
>>
>> I don't see the value of this change, though. Actually, doesn't the
>> compiler even bark at us then when passing in a wider type (which we do
>> so far)?
>=20
> ATM, everything is fine with the code. But as soon as we would pass
> anything wider than 16 bit, we would get a proper warning with this
> patch. There's no reason why index should be 32 bit wide.
>=20

My point is that none of the current callers of vtd_update_irte allow the=
=20
compiler to detect such a case: both run on integer types, both have non-st=
atic=20
limits for their ranges.

If we want range checks, they likely need to be runtime. At least we need w=
ay=20
more type changes to give the compiler a realistic chance.

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
jailhouse-dev/b19a1a1a-c956-91de-03a8-03afe327389b%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
