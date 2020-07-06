Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBB555RT4AKGQEJDA5FKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63d.google.com (mail-ej1-x63d.google.com [IPv6:2a00:1450:4864:20::63d])
	by mail.lfdr.de (Postfix) with ESMTPS id 9753B2157AD
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jul 2020 14:54:15 +0200 (CEST)
Received: by mail-ej1-x63d.google.com with SMTP id yh3sf28624243ejb.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jul 2020 05:54:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1594040055; cv=pass;
        d=google.com; s=arc-20160816;
        b=zJZEm5eUByIqwdoaadPfOHVMDeYviD0FVB5+b46tSbauwnt7OBvSHxy2jaYja0SDbc
         0HIuoFiwMVOkn6Vg8wuPKeX1zl6WkAL4NSQKbK5I+9qelEUN05tNpRSdaTbzLftA2RDx
         Eit5+6DnPoMhBC8MEVBMiYcw7glyq4VJ2hU6YyNZI1ARkw9RMBU2b6UGodoeyHbnPrE5
         b8avB5mmSrA7j995iTxIYENUgxLOVSm74+4K/tDH8vk5qOJB5LfAkTPK/wccbeqoF5W9
         tzCDjmX1bbgBC9cpYC4Pzyhekp6NLoKY5yPhEUQwuAC7w0AH38ExrJPsd6vBr/dXHn7h
         +23A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=+tksUHFbdrSyDSkQtmBdG5XcdHejJu1dh0iYVWMcBe4=;
        b=u8JGsjidEvbikdfGVyOr+HhJj+aSS2RcgZsCknybRw/gOHVmUcnXWYneVhIQ8K0k9Y
         maSmSueFJ3o6rXAwngBULeIYy9nOoCD3jFgPue0LSN9omxI1NZS5iGOwy7Gfrtocu3ct
         Ug96RQlNeWKFPaQgRmZzgZhZ5ggfp9lEpUetEpNdLixH0v9LkAxbduI3QNd7yP+e5LVq
         OVy/QtPP1WZiOLXBCb8CMnTOykZEWZco5DGw0CvH8RsoFUmxvk7NAKaucOto5yj9gpkC
         TTZsbm1QtYhTAVasMFTFxq1hEQCgOhsNQ6UN6ptPGnC9i4jKC2j5XAhfI9A6+4YyNkL4
         YMog==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=F3r35RaE;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+tksUHFbdrSyDSkQtmBdG5XcdHejJu1dh0iYVWMcBe4=;
        b=YhQVW1QuHgtyWkhEOIw0AebUZfKl1V1SJBYH8yKQQSggowC7Vg9q9eOx8JGgzlh+Ut
         v18H5k3T7OkU1vp4k3oLv528BP84jnkJdZ1yHfoJp7wiZydX+QM6Xkqs3xFOUPZ1b2xa
         OLta3yP5pnjI7vEC2gMM2kWs+TS5sXV0oB6uuijksaUXQmT+hgSGoMnNYtg5VZkbTOAh
         4QtjIf2OthGxADWNhtoYVKVn31DKH8vsT9yzjeZF+CUeyLb8qiHGKAm5A6Pa67tRkFuF
         cNTimOOUIhNqXUSm+HsqNJAzrALcOvOQmYH1/SZ1ngjn+HoeWIxZ33ngpuDUrFTcjJdf
         VYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+tksUHFbdrSyDSkQtmBdG5XcdHejJu1dh0iYVWMcBe4=;
        b=l90qEG/2l/uzLKlICgp0LFfmhpmQG0IgeARAgXAdci26ImkUOtftPueL15JOxeVnqG
         bTtjuCsyiaOKhgUV2/aixI1PAnjd7wDoU9H3t9glj2OaRDlQk7V7w1aTQK52xkcH8Kud
         S5Jy8HehqzS4DtUzSJQLxt/vkq+oF1y82sstFAYNtkvXVrkw+iYPTgzondK5JkymVbJy
         3Yneh0YVWLtl29cRnAEZW/QEewOoCmZZQHrRbmajkTZwhExlTriFtXcyn5Prq5Uu1rD0
         XeDxN0/hykV0w2J/elO5lGT8GbPWrLDxA1UklzEXgZhoHRQzzyCjAqgquWT4wPf+z5fH
         TLqQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530ta/GJd/ILuaM8vXU8tkoZY7UfjufAlhMXpkDeGrHR5oeQUy2L
	hw7Q7BdZOdaX1fVqf/d+qAU=
X-Google-Smtp-Source: ABdhPJzL2fBaxZUczzyPUf5RqVyntNt7G/RTpn6Z5sD2geO56rGmYxb9cuXJM7ShHWRxrUIrt5SrDg==
X-Received: by 2002:a05:6402:94f:: with SMTP id h15mr56557209edz.313.1594040055372;
        Mon, 06 Jul 2020 05:54:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:c142:: with SMTP id dp2ls3219797ejc.5.gmail; Mon, 06
 Jul 2020 05:54:14 -0700 (PDT)
X-Received: by 2002:a17:906:5657:: with SMTP id v23mr44505785ejr.196.1594040054796;
        Mon, 06 Jul 2020 05:54:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594040054; cv=none;
        d=google.com; s=arc-20160816;
        b=X+mOSsUNt0pI06ajNMsL9qJtNoOS6ZD3PhH6eI2MrRIE5J4awFWhnV3Md7u2V8jkiI
         ux4TLSZaWjx6CnMyZ4wE/ZPVe8cIvZKDXFTrQ4GAYBbMB24X4pQk9SFvLRh4j/CfgMJA
         duS7u0mIWzvImRbw/nqsOivGIfUiaFBp4EU3L7/1Pg45aWmkeq7fXFOPbv6lFsuEDX5C
         CmvPpLwu7/IL6QDRGIuD3+VC6OJuYvhFmeueF8IWvah3u5o+8pkLZG2viCgK8P0OOatb
         AVBve4sG/og+CiAGsZgYWqlsrmUT4EaYgm/kGfKtY16nWRdsxYygQaMJf/LaHQvdn7+l
         tg6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=Pvqbx6gr8vv9cldgeNvJkEi3EIluZEMZ1hPefzFrt9M=;
        b=OC9Psu7CbB8xFCikGxtHQlo7zGhPU3wW7yRD2UevscgVzPhy86vk6n9T69bEtRVbY6
         PIN7gnuJ4EfK0BrilxHBxcKJXYEDX7lWjg/HiiStWegMLGubGDGPLt5GhJQqhhjnSfaQ
         k4jphmZb4Qv653NQjFK3hrvNcmOb5zoh3WQjYhMALv/zDE2hlgA8gHeyJeuiLW2WO98P
         9khSJue91pRl9P4sw4KjCQ4hMJu02gf7mDtWXyDYhsowMet64arC3Y28I9bPrs7gSj+X
         phq4Jo/p9vZGs3n70zFaJIUt2Altlpkggnf/yPbbKTqlDWHE2ZWhtunIw1gworxtLp35
         odNA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=F3r35RaE;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id x14si1289241edq.2.2020.07.06.05.54.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jul 2020 05:54:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4B0lrQ2bznzxvD;
	Mon,  6 Jul 2020 14:54:14 +0200 (CEST)
Received: from [IPv6:2003:e9:af0c:8700:e9d:92ff:fe75:492b]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Mon, 6 Jul 2020
 14:54:13 +0200
Subject: Re: [PATCH 01/11] pyjailhouse: config_parser: store binary format
 specification in struct.Struct
To: Jan Kiszka <jan.kiszka@web.de>, <jailhouse-dev@googlegroups.com>
References: <20200630064228.4742-1-andrej.utz@st.oth-regensburg.de>
 <1004a1b9-70fa-c8aa-8f50-552b12155a3e@web.de>
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Message-ID: <85d2aa12-22c1-5445-1d26-e55fe3c9dc4e@st.oth-regensburg.de>
Date: Mon, 6 Jul 2020 14:54:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1004a1b9-70fa-c8aa-8f50-552b12155a3e@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=F3r35RaE;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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



On 05/07/2020 22:55, Jan Kiszka wrote:
> On 30.06.20 08:42, Andrej Utz wrote:
>> Improves its handling in the code and slightly increases the overall
>> performance as well.
>>
>> Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
>> ---
>> =C2=A0 pyjailhouse/config_parser.py | 51 ++++++++++++++-----------------=
-----
>> =C2=A0 1 file changed, 20 insertions(+), 31 deletions(-)
>>
>> diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
>> index 6b9d9066..b75b9312 100644
>> --- a/pyjailhouse/config_parser.py
>> +++ b/pyjailhouse/config_parser.py
>> @@ -52,15 +52,13 @@ class JAILHOUSE_MEM(ExtendedEnum, int):
>>
>>
>> =C2=A0 class MemRegion:
>> -=C2=A0=C2=A0=C2=A0 _REGION_FORMAT =3D 'QQQQ'
>> -=C2=A0=C2=A0=C2=A0 SIZE =3D struct.calcsize(_REGION_FORMAT)
>> +=C2=A0=C2=A0=C2=A0 _BIN_FMT =3D struct.Struct('QQQQ')
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 def __init__(self, region_struct):
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (self.phys_start,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.virt_s=
tart,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.size,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.flags) =3D \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stru=
ct.unpack_from(MemRegion._REGION_FORMAT, region_struct)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.flags) =3D self._=
BIN_FMT.unpack_from(region_struct)
>=20
> Let's clarify that _BIN_FMT is a class var by accessing it via the class
> name (MemRegion._BIN_FMT). Same for the rest.

While I'm not a fan of redundant naming for references, I can how would=20
improve code clarity. Will change.

Andrej

> Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/85d2aa12-22c1-5445-1d26-e55fe3c9dc4e%40st.oth-regensburg.de.
