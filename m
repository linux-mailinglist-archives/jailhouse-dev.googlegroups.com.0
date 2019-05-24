Return-Path: <jailhouse-dev+bncBAABB2ORT3TQKGQERW2U4HI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC67292CA
	for <lists+jailhouse-dev@lfdr.de>; Fri, 24 May 2019 10:18:50 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id 17sf1491714lfr.14
        for <lists+jailhouse-dev@lfdr.de>; Fri, 24 May 2019 01:18:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558685930; cv=pass;
        d=google.com; s=arc-20160816;
        b=kRXJw79oIE8dcPiHn7OpFdirdA8YQ2AYWPxDDw9Mo9gfX3vBpwRq0Nsw8QHNursCSo
         AWrOnxMVCHs8fIqx0EcYGYAvT8W35UdBDacQTca7NOh4aJfd0xOugnEUanjMcmxV6Vhw
         07Gdjlzj+KQV2qEcQMe5SkR8yeXaZ/PbGn6/5ol79or+L+sItHHXBQiOpWp0sfuNxqtI
         KM2hvvwv0xlWQTqSSeha+W1hnOwCcFJ8rUBfECmdnL1LrOsk/poN/hDZvmdzL/7gl1wM
         eLg49qfAlpKOolmyqTgTCnDxoev7oQ53/3qaJbsTaCBSzQDxLFZsdq2j0BU/NxMYw9eT
         GuiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=Go3GhCVdRhzZecgoh4QyLQ1rKZNJeyYkbvfNfrHldJ4=;
        b=QcSYUMj8zhOauJ17lOHMFLN/klDWX0/e3IllYA6o78+sEAunv7iIFrKqrq+HdhORyb
         KtVR6j9oo8OpQj+mgrdT8IUdvs7ZjkRCNkaepTUZhCgeJUuO/EokmOst/a+iNAOMCPXQ
         iFwkwzwEvl70GNYnDueg5gBBWoRUTYLUHACbNbcxTJaVVpHAOlHQ4pbOZoJtB0oS9C5C
         ExLYwvkEwwqqYFWr7FPH9Byz2cZuD9lr2f0PGWRtzxgc7+iLQe45W/fAdAknmqY8+LO7
         Md4DmPqrE85/5w/HairqIPEIOfAymL2wxt4G7qhxrMNsgJb02INBFAVVKPqWiBF7oko8
         fASA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=T6sYTzCD;
       spf=pass (google.com: domain of mario.mintel@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=mario.mintel@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Go3GhCVdRhzZecgoh4QyLQ1rKZNJeyYkbvfNfrHldJ4=;
        b=M3DTynkIJ0R3CH6pdhW1aJDlRW/4mA7Yxdn+6vuyX12JXG/9bpQgqolDdVf8Hd7x8A
         zIBIT+eiWPrt+XpwzatN4DYHZL1VP9jBMdr3wXBXulgDN5WzAS6DaHFTIH/TiaqMraNS
         G7zaVPRf+bQBzhfBN+K8b/0qTwqwW2WJ/782qHD2SLcJiX85fDxSSpoBkp4L8v8mUhee
         +NZLgSRcVo7M1e5Nrd0n2ttmp1gpuvzHOBw0TKqrFRPJ4UjBXFbBgkjoQox9pCcVn40f
         hSEBjMqJBajRJWb3VKuzVpqJKzslm1OuNsaqZJ4LdKHuHdhmY/0PY2JChl8ZVegQYY8u
         7rlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Go3GhCVdRhzZecgoh4QyLQ1rKZNJeyYkbvfNfrHldJ4=;
        b=r2mSDTa9a1bANJaDMK6RKwSzU72EuxnmMHpwP+ykATN/3vOsrj7KQcygcfG6HiT6nG
         njc9BrFqEMfQWtxJBSbVhxbdHFDBZfFL5+/vDrNuW35yir0RKYwzxgoj111t3RrAOAED
         mIbkGZfuq/HLOeBhwve3K1yBlYZdrRpESIl+fPi5w8WTCfVKP8cb4Ndy9468OQ5AP2WU
         kYagZ3VF5Y1e2MeWQah7nMWThTf+da65M2umoA/rZ8s4nXi9PakOf9aSatogFwlATSLF
         a7OMkD8giLK8kgfylHGNTGfXxHgL88V+X5YT1JEqc7Isu2954w73E25zcNWCjsqkO9qa
         8B0g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVRQ7rebL5DmN8cExlPEIsPYLAVt71EPl1VQ8n17NJ+S3FMzkXH
	LksMde6LTfZFB/O0tj20Oxs=
X-Google-Smtp-Source: APXvYqzM2enRIhnR5NudX7g7KO+i/IijAAGRri6b16if4iSCLeXe1E3mXDYdUTqLBf5+SjEHNsLynw==
X-Received: by 2002:a19:9cc9:: with SMTP id f192mr40411086lfe.121.1558685930241;
        Fri, 24 May 2019 01:18:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:12cd:: with SMTP id 74ls990045ljs.4.gmail; Fri, 24 May
 2019 01:18:49 -0700 (PDT)
X-Received: by 2002:a2e:98d5:: with SMTP id s21mr32662704ljj.142.1558685929655;
        Fri, 24 May 2019 01:18:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558685929; cv=none;
        d=google.com; s=arc-20160816;
        b=b1iwT5mIE64Q9SafnY+L2xKYayZTFl2yzCaawa/Em0rJuSfPTDf0BsJ/7wDsfNrkoS
         YbcTThYc9/mML6IiBrCrr/nnI/3ntcHNxCr9YR2iVaWr+o646oqLzxtepekdh6NhP8+I
         YWXlYL6iht82tTBCL+BSS+izJV//DDD9p0wvVq64sJQB1tAUobNdFgqLjOfnKQEOPVkI
         e3j6hiHpIp9+Nese1z/w8QCXI94ooyM9/VDNZ88cRm8Tz9TPMkESFBOyJ8MClkWpX3eO
         ms1/GfWxFrge4hxN3a06Da9TV2rvwJj/HP0URXel4aY0GTmHT7b75uAGoUxRuuO74ojr
         SThQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:subject:to
         :from:dkim-signature;
        bh=uXuEnWeTky5mLkrdGqFiL3y8/uYuGvkgR5nTCmuPa5c=;
        b=hIUTBN9Gn3VWmtO1omChzVKmkmQ1qvbD835pA5CiRone5RED102QyKVLY6wjZtFmyu
         M+rgMfx6/rk3+LthrPq9I0xlyu2X9m0r12hqFkMglG06KPkjiWcO2bXRb27lUT0QyU1G
         tNEuZzRXOZG+9hqrnjiK9vOIJoWFA4nfwJCJBEY4nMYEVieeJFbWFNZJTyR6py39x6mM
         eW3bNzx1YIx+zWHMxLmxIQvUK3xMP76o5lWZEgzE3K/GzHEofajw4HjAW6Cmf6RzkouI
         AsFfOb7GRuEVyXdtcESM1ovkpCfoDS8mEnkpps6i24u/Hh/BkthynRy1O9B0FT6DAs0f
         LlOA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=T6sYTzCD;
       spf=pass (google.com: domain of mario.mintel@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=mario.mintel@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id z22si78241lfe.1.2019.05.24.01.18.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 May 2019 01:18:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of mario.mintel@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S05.hs-regensburg.de (e16s05.hs-regensburg.de [IPv6:2001:638:a01:8013::95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S05", Issuer "E16S05" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 459K5N3DJtzyHh;
	Fri, 24 May 2019 10:18:48 +0200 (CEST)
Received: from E16S02.hs-regensburg.de (2001:638:a01:8013::92) by
 E16S05.hs-regensburg.de (2001:638:a01:8013::95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 24 May 2019 10:18:48 +0200
Received: from E16S02.hs-regensburg.de ([fe80::35c3:aaf6:6ec:9ec0]) by
 E16S02.hs-regensburg.de ([fe80::35c3:aaf6:6ec:9ec0%4]) with mapi id
 15.01.1713.006; Fri, 24 May 2019 10:18:48 +0200
From: Mario Mintel <mario.mintel@st.oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>, Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>, "jeanne.romefort@gmail.com"
	<jeanne.romefort@gmail.com>, Jailhouse <jailhouse-dev@googlegroups.com>
Subject: AW: Unsupported DMAR Device Scope Structure
Thread-Topic: Unsupported DMAR Device Scope Structure
Thread-Index: AQHVESypidB6NsBg70SY+wuqbhfXl6Z4hsaAgAFmufM=
Date: Fri, 24 May 2019 08:18:47 +0000
Message-ID: <06033e5ae7e3481d8ec67f55781c51ef@st.oth-regensburg.de>
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
 <1300fb12-e2eb-1a10-e950-9f7c94e1071b@oth-regensburg.de>,<3886ba1d-58e1-abb4-27b6-23b09863c6b3@siemens.com>
In-Reply-To: <3886ba1d-58e1-abb4-27b6-23b09863c6b3@siemens.com>
Accept-Language: de-DE, en-GB, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.95.106.138]
Content-Type: multipart/alternative;
	boundary="_000_06033e5ae7e3481d8ec67f55781c51efstothregensburgde_"
MIME-Version: 1.0
X-Original-Sender: mario.mintel@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=T6sYTzCD;
       spf=pass (google.com: domain of mario.mintel@st.oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=mario.mintel@st.oth-regensburg.de;
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

--_000_06033e5ae7e3481d8ec67f55781c51efstothregensburgde_
Content-Type: text/plain; charset="UTF-8"

Hi all,


On 23.05.19 07:59, Ralf Ramsauer wrote:
>> Hi all,
>>
>> On 5/12/19 9:51 AM, Jan Kiszka wrote:
>>> On 10.05.19 15:11, jeanne.romefort@gmail.com wrote:
>>>> Hello everyone,
>>>>
>>>> I'm still trying to get my rootCell running. I have for the moment
>>>> connected a serial port in order to have the logs in full (in ssh the
>>>> communication was down before I could have the logs). After solving
>>>> some minor errors (such as Invalid MMIO/RAM read or IO-port) I find
>>>> myself with an error that I can't explain:
>>>>
>>>>
>>>> VT-d fault event reported by IOMMU 1:
>>>>    Source Identifier (bus:dev.func): 03:00.0
>>>>    Fault Reason: 0x22 Fault Info: 38000000000 Type 0
>>>> VT-d fault event reported by IOMMU 1:
>>>>    Source Identifier (bus:dev.func): 03:00.0
>>>>    Fault Reason: 0x22 Fault Info: 3c000000000 Type 0
>>>> VT-d fault event reported by IOMMU 1:
>>>>    Source Identifier (bus:dev.func): 03:00.0
>>>>    Fault Reason: 0x22 Fault Info: 39000000000 Type 0
>>>> VT-d fault event reported by IOMMU 1:
>>>>    Source Identifier (bus:dev.func): 03:00.0
>>>>    Fault Reason: 0x22 Fault Info: 3b000000000 Type 0
>>
>> hmm, sounds familiar.
>>
>> On a Dell T440, we have the *exact* same issue with a similar card: a
>> BCM5720, pretty similar to your BCM5719. See my thread "VT-d: IOMMU
>> exception with unknown fault reason"). And yes, there we have an active
>> link on it.
>>
>>>>
>>>>
>>>> Is the new sysfs-parser.py the cause of my trouble or is there
>>>> anything I missed in the configuration ?
>>>
>>> Could be. 0x22 means that the device is not present in the interrupt
>>
>> We have no modifications of the sysfs parser and face the same issue.
>>
>>> remapping
>>> table of IOMMU that is responsible for that device. Try changing the .iommu
>>> number for that device from 0 to 1 or the other way around. Or is there
>>> no entry
>>> for 03:00.0 at all?
>>
>> Jeanne, were you already able to solve this issue?
>>
>> I manually parsed (my) DMAR, and there's a ATSR structure (type 0x2)
>> which is ignored by the config parser. Could this be related to this
>> issue or can it simply be ignored?
>>
>> In this system, we have four iommus. Mario, did you already test all
>> possibilities for .iommu (0, 1, 2, 3)?
>>


so I have tested all possibilities for .iommu (e.g. 0, 1, 2, 3).

The error doesn't change at all, not even the fault reporting IOMMU.

It's always IOMMU 3.

The reported Fault Info's are:

17000000000

18000000000

19000000000

1a000000000

1b000000000

>
>If that doesn't help, instrumenting what Jailhouse programs into the interrupt
>remapping table for the device in question against what is being reported would
>be the next step.
>

I will have a look into this.

>"When the Fault Reason (FR) field indicates one of the interrupt-remapping fault
>conditions, bits 63:48 of this field contains the interrupt_index computed for
>the faulted interrupt request, and bits 48:12 are cleared."
>
>Maybe, for whatever reasons, Jailhouse does not transfer the remapping table
>entry that exists prior to Jailhouse into the table that is formed during enabling.
>
>Jan
>
>--
>Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>Corporate Competence Center Embedded Linux

Greetings,
Mario

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/06033e5ae7e3481d8ec67f55781c51ef%40st.oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.

--_000_06033e5ae7e3481d8ec67f55781c51efstothregensburgde_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; color=
:rgb(0,0,0); font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple=
 Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI=
 Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols">
<p>Hi all,</p>
<p></p>
<p><br>
</p>
<div style=3D"color:rgb(0,0,0)"><font size=3D"2"><span style=3D"font-size:1=
0pt">
<div class=3D"PlainText">On 23.05.19 07:59, Ralf Ramsauer wrote:<br>
&gt;&gt; Hi all,<br>
&gt;&gt; <br>
&gt;&gt; On 5/12/19 9:51 AM, Jan Kiszka wrote:<br>
&gt;&gt;&gt; On 10.05.19 15:11, jeanne.romefort@gmail.com wrote:<br>
&gt;&gt;&gt;&gt; Hello everyone,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I'm still trying to get my rootCell running. I have for th=
e moment<br>
&gt;&gt;&gt;&gt; connected a serial port in order to have the logs in full =
(in ssh the<br>
&gt;&gt;&gt;&gt; communication was down before I could have the logs). Afte=
r solving<br>
&gt;&gt;&gt;&gt; some minor errors (such as Invalid MMIO/RAM read or IO-por=
t) I find<br>
&gt;&gt;&gt;&gt; myself with an error that I can't explain:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; VT-d fault event reported by IOMMU 1:<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp; Source Identifier (bus:dev.func): 03:00.0<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp; Fault Reason: 0x22 Fault Info: 38000000000 Ty=
pe 0<br>
&gt;&gt;&gt;&gt; VT-d fault event reported by IOMMU 1:<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp; Source Identifier (bus:dev.func): 03:00.0<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp; Fault Reason: 0x22 Fault Info: 3c000000000 Ty=
pe 0<br>
&gt;&gt;&gt;&gt; VT-d fault event reported by IOMMU 1:<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp; Source Identifier (bus:dev.func): 03:00.0<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp; Fault Reason: 0x22 Fault Info: 39000000000 Ty=
pe 0<br>
&gt;&gt;&gt;&gt; VT-d fault event reported by IOMMU 1:<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp; Source Identifier (bus:dev.func): 03:00.0<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp; Fault Reason: 0x22 Fault Info: 3b000000000 Ty=
pe 0<br>
&gt;&gt; <br>
&gt;&gt; hmm, sounds familiar.<br>
&gt;&gt; <br>
&gt;&gt; On a Dell T440, we have the *exact* same issue with a similar card=
: a<br>
&gt;&gt; BCM5720, pretty similar to your BCM5719. See my thread &quot;VT-d:=
 IOMMU<br>
&gt;&gt; exception with unknown fault reason&quot;). And yes, there we have=
 an active<br>
&gt;&gt; link on it.<br>
&gt;&gt; <br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Is the new sysfs-parser.py the cause of my trouble or is t=
here<br>
&gt;&gt;&gt;&gt; anything I missed in the configuration ?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Could be. 0x22 means that the device is not present in the int=
errupt<br>
&gt;&gt; <br>
&gt;&gt; We have no modifications of the sysfs parser and face the same iss=
ue.<br>
&gt;&gt; <br>
&gt;&gt;&gt; remapping<br>
&gt;&gt;&gt; table of IOMMU that is responsible for that device. Try changi=
ng the .iommu<br>
&gt;&gt;&gt; number for that device from 0 to 1 or the other way around. Or=
 is there<br>
&gt;&gt;&gt; no entry<br>
&gt;&gt;&gt; for 03:00.0 at all?<br>
&gt;&gt; <br>
&gt;&gt; Jeanne, were you already able to solve this issue?<br>
&gt;&gt; <br>
&gt;&gt; I manually parsed (my) DMAR, and there's a ATSR structure (type 0x=
2)<br>
&gt;&gt; which is ignored by the config parser. Could this be related to th=
is<br>
&gt;&gt; issue or can it simply be ignored?<br>
&gt;&gt; <br>
&gt;&gt; In this system, we have four iommus. Mario, did you already test a=
ll<br>
&gt;&gt; possibilities for .iommu (0, 1, 2, 3)?<br>
&gt;&gt;</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">
<p style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot;A=
pple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;S=
egoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size: 1=
6px;">
so I have tested all possibilities for .iommu (e.g. 0, 1, 2, 3).</p>
<p style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot;A=
pple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;S=
egoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size: 1=
6px;">
The error doesn't change at all, not even the fault reporting IOMMU.</p>
<p style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot;A=
pple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;S=
egoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size: 1=
6px;">
It's always IOMMU 3.</p>
<p style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot;A=
pple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;S=
egoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size: 1=
6px;">
</p>
<p style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot;A=
pple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;S=
egoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size: 1=
6px;">
<br class=3D"Apple-interchange-newline">
The reported Fault Info's are:</p>
<p style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot;A=
pple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;S=
egoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size: 1=
6px;">
17000000000<br>
</p>
<p style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot;A=
pple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;S=
egoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size: 1=
6px;">
18000000000<br>
</p>
<p style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot;A=
pple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;S=
egoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size: 1=
6px;">
19000000000<br>
</p>
<p style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot;A=
pple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;S=
egoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size: 1=
6px;">
1a000000000<br>
</p>
<p style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot;A=
pple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;S=
egoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size: 1=
6px;">
1b000000000</p>
<p></p>
<br>
&gt;<br>
&gt;If that doesn't help, instrumenting what Jailhouse programs into the in=
terrupt <br>
&gt;remapping table for the device in question against what is being report=
ed would <br>
&gt;be the next step.<br>
&gt;</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">I will have a look into this.</div>
<div class=3D"PlainText"><br>
&gt;&quot;When the Fault Reason (FR) field indicates one of the interrupt-r=
emapping fault
<br>
&gt;conditions, bits 63:48 of this field contains the interrupt_index compu=
ted for <br>
&gt;the faulted interrupt request, and bits 48:12 are cleared.&quot;<br>
&gt;<br>
&gt;Maybe, for whatever reasons, Jailhouse does not transfer the remapping =
table <br>
&gt;entry that exists prior to Jailhouse into the table that is formed duri=
ng enabling.<br>
&gt;</div>
<div class=3D"PlainText">&gt;Jan<br>
&gt;<br>
&gt;-- <br>
&gt;Siemens AG, Corporate Technology, CT RDA IOT SES-DE<br>
&gt;Corporate Competence Center Embedded Linux<br>
</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">Greetings,</div>
<div class=3D"PlainText">Mario</div>
</span></font></div>
</div>
</body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/06033e5ae7e3481d8ec67f55781c51ef%40st.oth-regensbu=
rg.de?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/06033e5ae7e3481d8ec67f55781c51ef%40st.oth-regensburg.de<=
/a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--_000_06033e5ae7e3481d8ec67f55781c51efstothregensburgde_--
