Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB7WIWHTQKGQEWBDY6OY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-xc39.google.com (mail-yw1-xc39.google.com [IPv6:2607:f8b0:4864:20::c39])
	by mail.lfdr.de (Postfix) with ESMTPS id E25572BBF9
	for <lists+jailhouse-dev@lfdr.de>; Tue, 28 May 2019 00:28:15 +0200 (CEST)
Received: by mail-yw1-xc39.google.com with SMTP id g202sf6249492ywb.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 May 2019 15:28:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558996094; cv=pass;
        d=google.com; s=arc-20160816;
        b=hvaj0g+HbrU8BTcL0Uii8gKB/QWFEXKud+17vlRTQIpLq2Glb5qBVe6nbLxDfA+yg0
         E75C6F2MmLufQmHFuGOXtON4Gf+vp1onj52MgU3EFWuinDn/HpRLeAIOUs9GD5qKJ+dD
         yvYP/wBf62UWzGzGbfzsfNgUP9MkNr0tiBgFMzB5l2784Mr+m2YFZGQrYyQMAqPQQnJf
         Xc8+iCmlxJ+qVuM3i42OzufS6Fk/nqP0X3RyQerWKDVL8ozgrJB5YcOhuGlaPmS+1cGY
         3Qup10P9+YhD1y9fIfFTFISV9lQCERzQy2pwG8L3E/HFnKs7B7cxavDfXqWlPGZ15toM
         ZEWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=fm9Q4tVapOc2cCQzkkFCADXzVZbAWfJGrtnuz8iXx+s=;
        b=k+wUTeKu6yUundAB/nLJTnKHDOdxvY8yXoGzXYDc5/kjmwz3hHjyNUmALNbRAd9GnC
         5+e3jDYrJB7rO4WBMkMrwErDmQZYjnulT+TEpbOuiJsfgb2Rs4R62HDMDr1ZHZCXlbx5
         iggIdy8v6HWnEzBfVrM6hNiNPr+t1haVh9WRz/KH2ycZTLt/+lAJ8WToWkQcr4nH6PJe
         GPtFAzsNpjd1YFfYpfUucpfG7Nlyz8qvchyRzZgThk+87Gz5ddCM7GYaXnNGbYKhDbJU
         u3eAnf1fNEBhB7emFMo1IilWYoe5qF7iPlZa+uihObyPwtltqn2jpbX8q2wnKB7hG462
         sklw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="OGdxDN9/";
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fm9Q4tVapOc2cCQzkkFCADXzVZbAWfJGrtnuz8iXx+s=;
        b=f7GmUfZlqnulqn8JRUzt5o29VFlzFkqKRhy7mFzlDOBFF0zMbu2Lttrnq/5FS0dvui
         73V/illyY1q7Veo/fyPlIzR8TPPpeIl50Vap+HvxvyNWhPR2Vuab1AIS1FhHhBvqOBuK
         Nb93KROljlnyPZkhDxGDTZ47Nblaz2fIP5WgjYed3VJ8B0x1lNt7w3FTrInDZlMdF9Uh
         OEFay53E4aoQT3dsX57by8kGfucW1BShzBuSsojzrDTS+eio7IeeTtuYuL8VjI8Mjyq3
         Xs5Z6ucL6xpy1y8UYyc4OfhF9wln/3ZyPH+SYsnJ76fm44xWqT/n05BFfss6/U0Uuq4U
         K8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fm9Q4tVapOc2cCQzkkFCADXzVZbAWfJGrtnuz8iXx+s=;
        b=R0yW0WKSKrzM0qZdmBNeJBI/pL+vORaNE07YhYP1nH6YI+JPRgm97HTZPwjBXhkOAn
         z5naW6yccdIINAQE9ZyZqCN2CLHMXrsbRmcG7zdeGuPxjPcZ7t/dau/y7V4xNR91qkNM
         RHizAyWQgXmyZPV9kwEiPuxWENIP9SUDXKbCTVqeRKtapM+Kf1fBkmGHO5pXhSroY7cx
         4zeKF/I/YLS3rx2Zno3cR9ZAL8oYmEcNpQDb1sVj57I7vvEWhtJGy+1/JljMSCCM6mFY
         w+zmZq2ssCJapyxUZXRBMuH9aDU3iUQWeWtD3PywhL8Znn/LotGr/FYvItatmh6uA/Xs
         B6DA==
X-Gm-Message-State: APjAAAXP0nYAir3/1WokwATjmCyv2TH8TzE6ZFZB+61519ZGEY4yyTmt
	SfVnQ0cmVoJW/3cOnDYqpHw=
X-Google-Smtp-Source: APXvYqxZyV6tplU+V2YAKDXqn34kRCOli5PPHYAIV5CfMs4kUnS48ILtUvPjQWOUTl69MURCUDKmIA==
X-Received: by 2002:a25:e656:: with SMTP id d83mr23039424ybh.178.1558996094813;
        Mon, 27 May 2019 15:28:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a81:32ca:: with SMTP id y193ls2095865ywy.2.gmail; Mon, 27
 May 2019 15:28:14 -0700 (PDT)
X-Received: by 2002:a81:3c90:: with SMTP id j138mr50500086ywa.1.1558996094349;
        Mon, 27 May 2019 15:28:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558996094; cv=none;
        d=google.com; s=arc-20160816;
        b=0zy/oWeBM9YOgUnSxEGyijhjkzRCRDfLjgEVCvkv5XsziVMkCHOSPmHayon7srlpGt
         eTOtv26bTY4c4A9jWfkPyPFHFNz6V52DKQkYF/mkMgH1V1sYIrE4DN3hbRqjhDISKf4B
         q91xxV4ZZHWA34HMTIy6e1TJJb15L3EgdBiSyTBIm/xegeKHQnlZNgg/yI96Lue4m7yZ
         8sxEzqR3EHzlTfLh7JZVa5Bj223kmsW9ajWltLpTzEQQdxaFSMbmixGBAFTfSvttsRF+
         w5+7sovMzQbATCiSt+xqTKiao4yK/G1ayRK0cmrP1zaHs8MPS3AS6okNfhMa6O6zmzDD
         leNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=UmybacTFqMo4ztvFY6w9vTlE7jyXWo5cn93eDbLk5C0=;
        b=MnBPOnCsMyzH6qJEMoJ+n4jSmglUbU9rkUv0h59VkJ8L6R5OSM92AqyL6VVrMgZNjT
         QGPQvNvImeAL14j2MoLUW4g/KYfNMnAhAAyafsSSYp0SGtzotXCDooEw43KdG6YogQb/
         q6sY7CzqBlGFa5sHBZKt0nZYwpWGmsIZPVxuVq9OwQ4PUT2KW1sfPsR5XQ0Hoc0kYrBq
         ZgmEV5dlhpU3XYxXO+OGEw0KRSkoaWXJybkb/KkR8ct9nTMYlefiVIDoiLX5N6aztH7P
         JdxStqWCk1fV4d5JTM4SK1W2VV2DXMi/93/YM+BPI3wdTdTW+fU+sm3r6IsvF7uSlBoc
         V07Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="OGdxDN9/";
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id d74si456566ybh.2.2019.05.27.15.28.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 15:28:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4RMSDBX029818;
	Mon, 27 May 2019 17:28:13 -0500
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4RMSDim010495
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 May 2019 17:28:13 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 27
 May 2019 17:28:13 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 27 May 2019 17:28:13 -0500
Received: from [10.247.27.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4RMSDgl067971;
	Mon, 27 May 2019 17:28:13 -0500
Subject: Re: [PATCH 5/5] ci, Documentation: Add TI's K3 specific configs
To: Jan Kiszka <jan.kiszka@siemens.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        <jailhouse-dev@googlegroups.com>, <lokeshvutla@ti.com>
References: <20190523211623.9718-1-nikhil.nd@ti.com>
 <20190523211623.9718-6-nikhil.nd@ti.com>
 <6fa30cc8-3c2d-4df6-c7e0-dbd398d157ce@siemens.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <b8c3b24d-3975-f137-8256-c9c6159f8883@ti.com>
Date: Mon, 27 May 2019 17:28:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6fa30cc8-3c2d-4df6-c7e0-dbd398d157ce@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b="OGdxDN9/";       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <a0132237@ti.com>
Reply-To: Nikhil Devshatwar <a0132237@ti.com>
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


On 24/05/19 7:37 AM, Jan Kiszka wrote:
> On 23.05.19 23:16, 'Nikhil Devshatwar' via Jailhouse wrote:
>> From: Lokesh Vutla <lokeshvutla@ti.com>
>>
>> Before building jailhouse for TI's K3 platforms,
>> ci/jailhouse-config-k3.h needs to be copied to
>> include/jailhouse/config.h
>>
>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
>> ---
>> =C2=A0 ci/jailhouse-config-k3.h | 2 ++
>> =C2=A0 1 file changed, 2 insertions(+)
>> =C2=A0 create mode 100644 ci/jailhouse-config-k3.h
>>
>> diff --git a/ci/jailhouse-config-k3.h b/ci/jailhouse-config-k3.h
>> new file mode 100644
>> index 00000000..65e02f08
>> --- /dev/null
>> +++ b/ci/jailhouse-config-k3.h
>> @@ -0,0 +1,2 @@
>> +#define CONFIG_TRACE_ERROR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1
>> +#define CONFIG_TI_16550_MDR_QUIRK=C2=A0=C2=A0=C2=A0 1
>>
>
> We only track in ci/ what we enabled for ci. In any case, when=20
> following Ralf's proposal for patch 4, this should be obsolete. '

Alright, I will repost the series taking into consideration the UART=20
flag and drop this patch.

Regards,

Nikhil D



>
> Jan
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/b8c3b24d-3975-f137-8256-c9c6159f8883%40ti.com.
For more options, visit https://groups.google.com/d/optout.
