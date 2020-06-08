Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBKOJ7D3AKGQEKSAVGGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x438.google.com (mail-pf1-x438.google.com [IPv6:2607:f8b0:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2B91F1811
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jun 2020 13:44:43 +0200 (CEST)
Received: by mail-pf1-x438.google.com with SMTP id f14sf2631535pfd.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jun 2020 04:44:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591616681; cv=pass;
        d=google.com; s=arc-20160816;
        b=H39ZNsc3DDBLpVy6kIVM6KwUaP43HnoOeOkLtODyjMGAA8ol1VTu5ZhHkILJ4UOSVl
         R3tozf9dohELaWIAMkJJrNrm7XVyrjYV8gTiWFuv0in58bHgIlH26hsHRpxBIrZkeqjw
         XuEOIq4mw0GGPEOrN0jXTXCH/1aj/tdbI6S/isPW3qXPYzTBex+bWtB03Fc8V7oKNZMz
         X43ggIk8j4IBFZl1wMREG/WDEM+nL2P21RGFS5sVOAQpncxWDHOzUvmBSr1q9cP20+7+
         5/BRjSmWxij1eudlizJvxq629MuzzmVkhiJ++ucTMRiIgLKy01sQTui52an3i7m6Nd78
         T7Kw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=ZdZlp5dYrbJg8iFer+bZnAHqxGDEkn7bcwEGV2xyn1w=;
        b=CdPrEdwWKox+uhyQw/YC07QJBZ88YY5Th4y5s0B9r3wIB9dn1Q2Hzhk8lexQokMIF1
         bZsxbE9v4m5PCQlgJPkYPYJ9vpTdc4tdW9Zp+VGZtAgrUh/L8b37FBqGJcE8oSow4ooE
         DSXRmC5a1aVtol+nAD0J4K9WHNTnp8uEPdGZswyNiPAvXjX9gIYjdJnxl/QJ6sRbF7X1
         xgIiQzy27iU5eqH2zD02hvokFuYNHNR2NGZAwD6RyMESHtrFPnvDbUCJ9p4skR1JXDYw
         Pe55JT3ZcYp8q45mKhmLaRc2A5b7DQf7DeELUMt0kLV/2FGJpB2D+OwCBEQjRRecjFVL
         ijgg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QHt5xDCc;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=ZdZlp5dYrbJg8iFer+bZnAHqxGDEkn7bcwEGV2xyn1w=;
        b=OZv0vvJSam7m+c4Px6UaOBrGsjGQOpP/euJ86yWvgtUoFxfdRNuFKCuK/Ku9klHUqy
         Hz/94vGlapyu1Q8r55ohxGkk09j2bor6QdV0J1Jr/8Nrnqqr2/R5R8TQyXGwcTEwrPYs
         s7fTIYWMgMjv3wUY2hrTky/tIiHIOmTkLZVSRBVo2Ch7xUCSQPy+xSCPplOlT1vqziWf
         g5V4EEjvMUVcCd4LEYB1F9nDgl433nRjXbG/ebdVmzNq7rlkqrvw7lOilzc0pNCM4qd/
         YABmNGDjp+wQ7O+njks+wAG7B/3A1NsbcbXgVkg+OaQxYxGzET5puqJBk0L2YJQbdZhl
         FXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ZdZlp5dYrbJg8iFer+bZnAHqxGDEkn7bcwEGV2xyn1w=;
        b=POfn5sybrHHQDrkSh3gveWYqYCwAvYeUQzluAcz0DG3rKX/6eVf9MnID4/KOVkX/qK
         hJiskZPvJouL8eyXdJDD24UE+774NT0TrL8rWBafOrVaKr77PwvEQCMfUVfEbwXiqoiB
         kytCVW+1KHgt6sv7Ll80qKVDLyJbMAXkbJ7OWViLYKQCfs8Kh6Q2wbwiuark7X8glYrK
         LUyev5GdTk83S5fBjwbNmJZdMTz1jfL2eDiASFcOg/MqT9/dHrGlfJskHoOgj2anmopj
         hgJ9Yt6NnYgYC+YiIQUXosXFJrrBrVe3Enddsqp4QrZEHK/QIsA4HkHf0Yg7JIYtHfDm
         dHyg==
X-Gm-Message-State: AOAM531S14ajy44UV7OppiKH5tcXeiWJ+ODI+O/zFdkrG9kznlgx8Pvv
	LX5kEm5mVLMAmRIyi4nkBI8=
X-Google-Smtp-Source: ABdhPJwAdY354RW5t+4Xpt1GTogFqOg4FUA/dzf8dHou4/On55cO+Qyn+h9k0lxNx5GCwkCmgNbnqA==
X-Received: by 2002:a17:90a:950d:: with SMTP id t13mr17673920pjo.102.1591616681419;
        Mon, 08 Jun 2020 04:44:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:c253:: with SMTP id d19ls7817668pjx.2.gmail; Mon, 08
 Jun 2020 04:44:40 -0700 (PDT)
X-Received: by 2002:a17:90a:d809:: with SMTP id a9mr17380909pjv.212.1591616680849;
        Mon, 08 Jun 2020 04:44:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591616680; cv=none;
        d=google.com; s=arc-20160816;
        b=KACXHWEiMw4J0C2P53x9NfS5ctufywLC1klNb3ZoM017oJoUEnJlwRhHpqyxvkUYt4
         9IFEBvHNJnZ8A4NRC89Z+d6u1wtWPG99XX2xyjMJ5DCuFce4Seys46Afjh9iIjhcfLTR
         QjFgg6XP1UanMp8vOqX8Vg9iKsHCWaiz0+pReCvlNQ50iCsSFOQ8kpRQMydobWt08E3a
         ShyezZaNBFrP4cK3JN8UptrYLR6s+4owLSrupFRBvV5QP4etP3O1Exs0iD4QaWA+7XUr
         XH3SiWAO9erf10XNhHJKMtFoGsze9yLgKt+BwzhK6Z3BdT01pfgBSmXTPb2BV3JmA6NJ
         63Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=bPcI1KEblVekOaIr4BTL/k290fqXjOQePrlk9AU+mn8=;
        b=i5HLN7Wo9O1U/DCP0t+PKBrfy6x9vHa+nAMvknPaNMgZ4yFEhmADU9qE6NXPcXKaz8
         nlMvnFrPOE4rc7phg09pfjfwNUQrlNjWbHLWBWgs399qxuLB5Gg/GZxHXuQj0CfH16R9
         rtLEO2R9EnYDKFZot1w/XcEi4vY6vojqf8L8N4canHcXOJqI2cOt8n0QkQc4+WDAvbvh
         gjsqfiq5117aZ0Y8rt1R2FcxUT7KZIYV7EhEBpHJz/TxN2yUUKRa9stcAjtGql7conpF
         Z5iZ7ge64F5Dvws5409x7J7OLMGstLwmaz3Fdzz2jJ9/jKvonMnnhXGtMtJXODp4XCs3
         XAEg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QHt5xDCc;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id t23si54332plr.4.2020.06.08.04.44.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jun 2020 04:44:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 058Bidwg004935;
	Mon, 8 Jun 2020 06:44:40 -0500
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 058BidgK093203
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jun 2020 06:44:39 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Jun
 2020 06:44:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Jun 2020 06:44:39 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 058Bibeb106250;
	Mon, 8 Jun 2020 06:44:38 -0500
Subject: Re: [PATCH v2 7/9] tools: ivshmem-demo: Pass peer_id command line
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: <lokeshvutla@ti.com>
References: <20200608104255.18358-1-nikhil.nd@ti.com>
 <20200608104255.18358-8-nikhil.nd@ti.com>
 <0cc3f3d4-f04c-55e2-031b-63a8576d7aff@siemens.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <af24e9dd-dfac-015d-80af-6feb841b478e@ti.com>
Date: Mon, 8 Jun 2020 17:14:37 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <0cc3f3d4-f04c-55e2-031b-63a8576d7aff@siemens.com>
Content-Type: multipart/alternative;
	boundary="------------FD023F48B3EFBC0350541A1B"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=QHt5xDCc;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <nikhil.nd@ti.com>
Reply-To: Nikhil Devshatwar <nikhil.nd@ti.com>
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

--------------FD023F48B3EFBC0350541A1B
Content-Type: text/plain; charset="UTF-8"; format=flowed



On 08/06/20 4:43 pm, Jan Kiszka wrote:
> On 08.06.20 12:42, nikhil.nd@ti.com wrote:
>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>
>> Number of peers available on a platform is different.
>> Do not hard code the target peer_id used for interrupt.
>> Parse this from the command line argument.
>>
>> This de-couples the dependency between number of peers.
>> ivshmem-demo can be run to communicate with desired target
>>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> ---
>>   tools/ivshmem-demo.c | 12 +++++++-----
>>   1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/tools/ivshmem-demo.c b/tools/ivshmem-demo.c
>> index 163653e1..98d24111 100644
>> --- a/tools/ivshmem-demo.c
>> +++ b/tools/ivshmem-demo.c
>> @@ -91,10 +91,11 @@ int main(int argc, char *argv[])
>>   
>>   	pgsize = getpagesize();
>>   
>> -	if (argc < 2)
>> -		path = strdup("/dev/uio0");
>> -	else
>> -		path = strdup(argv[1]);
>> +	if (argc !=  3)
>> +		error(1, EINVAL, "Usage: ivshmem-demo </dev/uioX> <peer_id>");
> Please make peer_id an option, not a must. Maybe -t|--target <target>.

Okay. what should be default? 1 or 2?
Nikhil D
>
> Jan
>
>> +	path = strdup(argv[1]);
>> +	target = atoi(argv[2]);
>> +
>>   	fds[0].fd = open(path, O_RDWR);
>>   	if (fds[0].fd < 0)
>>   		error(1, errno, "open(%s)", path);
>> @@ -113,6 +114,8 @@ int main(int argc, char *argv[])
>>   
>>   	id = mmio_read32(&regs->id);
>>   	printf("ID = %d\n", id);
>> +	if (target >= regs->max_peers || target == id)
>> +		error(1, EINVAL, "invalid peer number");
>>   
>>   	offset += pgsize;
>>   	size = uio_read_mem_size(path, 1);
>> @@ -180,7 +183,6 @@ int main(int argc, char *argv[])
>>   				error(1, errno, "read(sigfd)");
>>   
>>   			int_no = has_msix ? (id + 1) : 0;
>> -			target = (id + 1) % 3;
>>   			printf("\nSending interrupt %d to peer %d\n",
>>   			       int_no, target);
>>   			mmio_write32(&regs->doorbell, int_no | (target << 16));
>>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/af24e9dd-dfac-015d-80af-6feb841b478e%40ti.com.

--------------FD023F48B3EFBC0350541A1B
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <br>
    <br>
    <div class=3D"moz-cite-prefix">On 08/06/20 4:43 pm, Jan Kiszka wrote:<b=
r>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:0cc3f3d4-f04c-55e2-031b-63a8576d7aff@siemens.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On 08.06.20 12:42, <a class=3D=
"moz-txt-link-abbreviated" href=3D"mailto:nikhil.nd@ti.com">nikhil.nd@ti.co=
m</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">From: Nikhil Devshatwar <a c=
lass=3D"moz-txt-link-rfc2396E" href=3D"mailto:nikhil.nd@ti.com">&lt;nikhil.=
nd@ti.com&gt;</a>

Number of peers available on a platform is different.
Do not hard code the target peer_id used for interrupt.
Parse this from the command line argument.

This de-couples the dependency between number of peers.
ivshmem-demo can be run to communicate with desired target

Signed-off-by: Nikhil Devshatwar <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:nikhil.nd@ti.com">&lt;nikhil.nd@ti.com&gt;</a>
---
 tools/ivshmem-demo.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tools/ivshmem-demo.c b/tools/ivshmem-demo.c
index 163653e1..98d24111 100644
--- a/tools/ivshmem-demo.c
+++ b/tools/ivshmem-demo.c
@@ -91,10 +91,11 @@ int main(int argc, char *argv[])
=20
 	pgsize =3D getpagesize();
=20
-	if (argc &lt; 2)
-		path =3D strdup("/dev/uio0");
-	else
-		path =3D strdup(argv[1]);
+	if (argc !=3D  3)
+		error(1, EINVAL, "Usage: ivshmem-demo &lt;/dev/uioX&gt; &lt;peer_id&gt;"=
);
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Please make peer_id an option, not a must. Maybe -t|--target &lt;target&gt;=
.</pre>
    </blockquote>
    <br>
    Okay. what should be default? 1 or 2?<br>
    Nikhil D<br>
    <blockquote type=3D"cite"
      cite=3D"mid:0cc3f3d4-f04c-55e2-031b-63a8576d7aff@siemens.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Jan

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">+	path =3D strdup(argv[1]);
+	target =3D atoi(argv[2]);
+
 	fds[0].fd =3D open(path, O_RDWR);
 	if (fds[0].fd &lt; 0)
 		error(1, errno, "open(%s)", path);
@@ -113,6 +114,8 @@ int main(int argc, char *argv[])
=20
 	id =3D mmio_read32(&amp;regs-&gt;id);
 	printf("ID =3D %d\n", id);
+	if (target &gt;=3D regs-&gt;max_peers || target =3D=3D id)
+		error(1, EINVAL, "invalid peer number");
=20
 	offset +=3D pgsize;
 	size =3D uio_read_mem_size(path, 1);
@@ -180,7 +183,6 @@ int main(int argc, char *argv[])
 				error(1, errno, "read(sigfd)");
=20
 			int_no =3D has_msix ? (id + 1) : 0;
-			target =3D (id + 1) % 3;
 			printf("\nSending interrupt %d to peer %d\n",
 			       int_no, target);
 			mmio_write32(&amp;regs-&gt;doorbell, int_no | (target &lt;&lt; 16));

</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
    </blockquote>
    <br>
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
om/d/msgid/jailhouse-dev/af24e9dd-dfac-015d-80af-6feb841b478e%40ti.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/af24e9dd-dfac-015d-80af-6feb841b478e%40ti.com</a>.<br />

--------------FD023F48B3EFBC0350541A1B--
