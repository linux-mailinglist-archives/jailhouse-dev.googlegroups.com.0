Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBHWERT4AKGQEJQ5P2KA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C69E215804
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jul 2020 15:07:43 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id z12sf28883649lfe.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jul 2020 06:07:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1594040862; cv=pass;
        d=google.com; s=arc-20160816;
        b=fcB5j/44UFNKNDnIKJdSgpLggB+QitoJLw66eigp4UU516X+SSdIvSpy1iknVLow0W
         MC9K3aSG0PMlndKBXz8qrikCp+DwOEMZf1jePPdKHfCgZYemIRV1JJv4y4r+jdA33la7
         7nMmltDlupu7VhkoQfC9Vi0bZ+HnYeqOrHWdx19wmupPHlLy/FnOojkNMrCg3f06tTHx
         RQvaQy/IjnqKVpULkHIAGX2ZZO+4rgP9CgZuHLTMgl8EkdxAXhjbaZZlbwr+S+RaPfR1
         N0JZ7VDGaD0kNHcvWcIivXB7TeasvnuHIEOs3EEb1eWYwXoRTZrRb860sht/fyGNy6EX
         0H3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=VzDwLu6OuXOgOTvL8gm2c/NFibgcc9PHlRrmN4hudvI=;
        b=npTuedIuUZ8qL10QRwfYKX5wTikJ4B2olIMyWl5Z7M4gG1YOThWL35UMm3N0FRLFKP
         TIYFSfV80+/NPwQ2821/tVW/kmSJ/RnzIEJZRqBUfGCyBDIljtK2HVOfMXKoC87ku9ei
         mR+CzuOBgtNGIDSjr5g8oX9Vli2Na6AJc1rc0Jc4KO+QBRcE0cRJaoVy6vgQo9c6zm8x
         t5oLG2iNQDU5pl3XXOCC05Cga2JaJSirKq5tGC0HeEsjNgJOjzwfpja4ZMtgjirujWXe
         hl6ikZSjMfzQzVc1kZMqBpcCAHu6h4XGyz6pJU3KZ0OnUMD/iWnqf3H7h7Tb29Wt6PMR
         ru5w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=HOd8wPkr;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=VzDwLu6OuXOgOTvL8gm2c/NFibgcc9PHlRrmN4hudvI=;
        b=oFt6cSbl6JZtyhm+14sMAGQWFbHT5p1Msldw9BUjwhitnbeHBlFTzrHlKWfTas/oUk
         APRBhvFbJAg2HjLsYZuTfWLYY51GcHVj9GLUheOuo37O2wKWs683tHEOoKZPGEMat/ZF
         BZUvZn0Xdf8MsC7BVnYUjr2cIt1Ijv0k+7YHynXCNiF3UTq70qncCvrm4yJUFJ1SpAGh
         Lb9drSeEuNZE2A1EzARvP2zxx3nWE9DBT6ic7VxUVPVN0TV2G+TNb4bW31bHNog+NlRr
         fBARsK9BmANituLRu5X0sKbm1yyDePbHa+L4cRgXHH8UK+Ko0kNipY40HuKJx3RyanQ4
         5hrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=VzDwLu6OuXOgOTvL8gm2c/NFibgcc9PHlRrmN4hudvI=;
        b=Kb6AGxqXU+ZqzkHgMvkByj0sm8l4XG8jjCq/6xTaY8yFZridKcK3zpgCdLXrYyYT1O
         jJP7sgMwQFR3WkxeRNAsvTyhMyHiDLEuwIONQaum75I3+sQoyxQrEHYSJcy6nBiOEaRk
         9gWPK8A2wvrQg7YRKCRXbULLc8s5A9d+YM5o14U8MAktlgIhDTs/zjbwf93uZtEXPrQ/
         PK+1+OvyKcjZt2gdJGaVRzwi3CtX2/ESnQIY3/x8FrhzMQP54uJyzKXc/MTOr6h19qza
         JpkV+Uj0aNFHtc4smC2Vl8UzkMkRuvNCAP3rk59yvIT4GILa6u5LewmkN6Lngry1Hn4L
         DpNA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530jZMRB9AziDVRyI/RsHO+/1r1KXcxFDVK7I2XnqiDU8nVVFmU7
	RO+9laEAwqb70klf5v7Uxfg=
X-Google-Smtp-Source: ABdhPJxznQGTIyRIKO7O0Bg83XtZ+xwuNFaxXLVv4+A+dwYtEXcSPadD5pmNdojnhC5to2aA1Igv2w==
X-Received: by 2002:a2e:8699:: with SMTP id l25mr19437980lji.81.1594040862577;
        Mon, 06 Jul 2020 06:07:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:94cc:: with SMTP id r12ls1220963ljh.5.gmail; Mon, 06 Jul
 2020 06:07:41 -0700 (PDT)
X-Received: by 2002:a2e:9bc4:: with SMTP id w4mr26132680ljj.391.1594040861682;
        Mon, 06 Jul 2020 06:07:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594040861; cv=none;
        d=google.com; s=arc-20160816;
        b=d/b63JUA2qNNoEA0gVkZnk6pUz7ZzGq5brwF7iq8wIMKDm0RXNAqI0Rv6x+6WppAX0
         Weal8h83bFRWmHIDrynVwdayGclQ1AKjxXrMEtBoOa6Uy8aLeNrhDA1h9n/IP0rUb1kZ
         03/ZCZY/F82NQgYEzwvgO7fFn7MpTfh2q0AFqXnQ9sJwdrmLRQWvpJnaO3d0jD19Bkir
         hA8K8KpCd3Oay1UKVmLUOKTN5ljZ3wenC0rqnfj8WMGNUlxUZzoH4Kc14WmOQBC/Xe1T
         w38HcNuwqBxH17uSvQCytu3YQux3qEYtrM+drh42MiqCXU42EwIq+kz7Wlld0c74BggO
         qxig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=ashYd3KliaGjq3PeXJP3DO3sgV5BXk98LdV+2rc1JjA=;
        b=WQX1nUDS6GchOp7xNvM/1sUl+ekvDTrE8Bd7s2r2k55muRFJCBGkDRYoGhSoccMnzt
         u0oCVysu7ESvvKt25KCcOyvfzOMh5Oo+1ijSa8PbtnX3jmhXK7Nsnw0rpaImROIR6qpc
         ZHjqTMmwQDrYHmtyo/Z7HnyXMBiIm0tSz8yiRTjNct7/d4UIG/FKkBpTOR8BijuJjhSP
         yXdpPlcmAFxmiHYGjsQm5KA6tshVuL7LwVoH5EWN7X9YMi5laDXjYuUidP/k9ii/4wUs
         Jpxu99wDaJ+wc4NuKnRUmYaHvdnoeiOu4VILaQNo3acc5RmBHKH8OgS3LqKeRI8ejLyN
         0uOA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=HOd8wPkr;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id r21si1161321ljp.0.2020.07.06.06.07.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jul 2020 06:07:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4B0m7w5XRvzxvD;
	Mon,  6 Jul 2020 15:07:40 +0200 (CEST)
Received: from [IPv6:2003:e9:af0c:8700:e9d:92ff:fe75:492b]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Mon, 6 Jul 2020
 15:07:40 +0200
Subject: Re: [PATCH 03/11] pyjailhouse: config_parser: consolidate binary
 parsing into CStruct class
To: Jan Kiszka <jan.kiszka@web.de>, <jailhouse-dev@googlegroups.com>
References: <20200630064228.4742-1-andrej.utz@st.oth-regensburg.de>
 <20200630064228.4742-3-andrej.utz@st.oth-regensburg.de>
 <1a36f470-27ac-42fd-2dc3-e990bf671164@web.de>
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Message-ID: <6284b928-851d-36bc-0b82-c7700a932c76@st.oth-regensburg.de>
Date: Mon, 6 Jul 2020 15:07:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1a36f470-27ac-42fd-2dc3-e990bf671164@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=HOd8wPkr;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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

On 05/07/2020 22:57, Jan Kiszka wrote:
> On 30.06.20 08:42, Andrej Utz wrote:
>> The class slots define component fields in a more grounded way.
>> This greatly simplifies definition of parseable compoments.
>>
>> The first `__slots__` tuple in each class defines a constant list of
>> fields and also the corresponding binary ones in the C struct.
>> `_BIN_FIELD_NUM` ensures that subsequent slot additions are ignored by
>> CStruct as they must be constructed by the owning class itself.
> 
> _BIN_FIELD_NUM is always len(__slots__) - then why do we need that extra
> var at all?

Because in come cases additional __slots__ fields are added (e.g. 
SystemConfig), which do not exist in C structs. To prevent the 
struct.Struct class from complaining about mismatching field count 
between slots and format, I've added a numerical boundary 
`_BIN_FIELD_NUM`. It contains the number of actual fields in the C 
structs, which CStruct class uses to restrict parsing.

>>
>> For complex parsing the class method `parse` needs to be overriden, see
>> `CellConfig`.
> 
> "overridden"

Ack.

Andrej

> 
> Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6284b928-851d-36bc-0b82-c7700a932c76%40st.oth-regensburg.de.
