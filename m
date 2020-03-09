Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBXWOTDZQKGQE7MK27NQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1037.google.com (mail-pj1-x1037.google.com [IPv6:2607:f8b0:4864:20::1037])
	by mail.lfdr.de (Postfix) with ESMTPS id 635D517DEA5
	for <lists+jailhouse-dev@lfdr.de>; Mon,  9 Mar 2020 12:24:16 +0100 (CET)
Received: by mail-pj1-x1037.google.com with SMTP id gx20sf2478606pjb.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 09 Mar 2020 04:24:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1583753055; cv=pass;
        d=google.com; s=arc-20160816;
        b=IEp+5mTAM84c6EMX3tlt6tK6hmrORZB4rZt2bzmNlZg1rxyL2H6rotHlpdx0RaA+3B
         1VYh893xHGuO0xUBr3+8LEE7HXEFBhl+FJDNMj8aB7jxnkzwuFDEJ9z5F1a5oBYT2iv6
         SvWtzFBQMRd6+wvbnhn/xqlA9w9MxvB3HldClcynRxe6Oc9e6MiFRzjWxVTjop+RB/yj
         601JcsJW89qhexfNGRbNfovtTtpXSn5U5Z2tbA9JD3fA3VzRzm4MynY2EhtTCSQYJ/x4
         BxbFRe3hf2r4VfzUy1DA19ha3ubNkU3ACwYirl8oldXqTG86UV+6kLdKwL3+vF6Elr9J
         t/2A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=mbekktWVyE+hE7lJ67UBn8OqrcIVGjzsiqng/P/YxXY=;
        b=SDa2wucmBmmn6b8eCqZ0Z1okuNGOkraiTvLUKq7jj1AC53kkLABmeAtgpnSYpRIvoz
         LZFzGlyCq5PIwqbmCK+70d5r+VC+LXK4bMKm2qznbdMomSpvTUFtdZyFZ8FzV8UcpnHA
         z2WJZ1/v3LSqxehRdxcjHJHkAh4xTbYL24bblo/e6OIOH9zsCP9ty98otYqXlx/UADi1
         YHne8YXMQ2p6yUZVFFlh9keOZBn0W6PlkGLjM8Uog6MDuMci5gDIWmmqY0pvagm2c4OJ
         r0HKjidefke/f+uWyN1gjXxcHBbFnrY1TF+002f0T4Zjo7cMv/YiUM4osHkJLqaM521B
         VJng==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=t5SgWXQK;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=mbekktWVyE+hE7lJ67UBn8OqrcIVGjzsiqng/P/YxXY=;
        b=Ac0iU0frEQVaS4F+7n692iU75qo7BMvC0kIYce6BYW9pvgSAhmSUJk7ge6oUGNTVnb
         hg8Pa4fbfj9zRGQMLyCtfowFXStzI1OMEW7HMN30OlZimPQ7s+1t/KtWPN+K+qq4DZ03
         6Ig6YeCbaTQcg82rIDGXvXsCaAZVQrWeAQjZpTrYrMOo+Bq4mjT9WKE7zLsoauu5WdI6
         774qyzyqQi9ZhK1esonyDFeuPrdF6bdBbvHw7XewK8x+DldgRfx+xjuPweiUq5z+HQ9y
         0aCV5nGFiCv6vI48QiM4CwAyR6dRcA7OVNgP6LBdSWya5PgCh0fzhZLgxqOgF5ihuIKK
         9HxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=mbekktWVyE+hE7lJ67UBn8OqrcIVGjzsiqng/P/YxXY=;
        b=ovtdp9+KipITS83caxaccaXKgtJ4sc1qU0PEvytcqZu7dAkHTqjDvTrZ5wf9DfCZ69
         VmHX4DYPz9IQ58hC7FARKIpdffDKS1UKuL7ywrJ+YKaH7RXVmEGSwx20TW33WPd3Nvee
         6y3htsdI6BHIP3/cHdLWyZ5/LdApXGNWkLrX8ObEm2gYiUmqhm9ESVoGfqcpsrkKLNoV
         y/lAxzn4U50947kaykDUK/va/nDZtykUDlFUetQOYRTqPrguHV0jowkCH+qqKPUyls7H
         rlU469gQO1QhCG4nbLS5fxuxF48Dc+zh7iWiapJcy8loYRpJEILo+nlA3zEHZ7mWrSDK
         VYhg==
X-Gm-Message-State: ANhLgQ2N/jlHjjf1n1SZGfJZhRgikBQC0sLyET6lTpqL/fSDdBv5KP7t
	0kXNbkQ1OOjqsc4ooMnUip4=
X-Google-Smtp-Source: ADFU+vugZdzMdxJbwAvdwfvLtq7cojDo1IzPzI9pjRIs5WH3xaMylMkk0LpMkcEFpLy7o0JtquyvmA==
X-Received: by 2002:a17:902:8bc7:: with SMTP id r7mr15686346plo.12.1583753054957;
        Mon, 09 Mar 2020 04:24:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:ab86:: with SMTP id f6ls4146999plr.10.gmail; Mon, 09
 Mar 2020 04:24:14 -0700 (PDT)
X-Received: by 2002:a17:90b:352:: with SMTP id fh18mr12903500pjb.168.1583753054331;
        Mon, 09 Mar 2020 04:24:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583753054; cv=none;
        d=google.com; s=arc-20160816;
        b=uMYoaLh/m3AdpLlo0m8mgKAsAp9Lgb8q57+8XNDY76TOVf+FIBR+eeJ/5ylhVMPmka
         2n91+UnKavNBHmZcn8Cft0RPiYF+7KDu4ZnfpTFw5ZqgoXZvbJCtdt+WkHtu2eABiLGi
         xWuSDOvJ4Int95gIBUpm7YQjvd7K+tzHXK52HVRkzfrwH0xQ1W1sZPrdU/N3sSEfaJnf
         /UjPwXm2RiM1iyXSgj0SbwFAF1aTH6vNpu8jOWP3ZUkKvJDdejOwsAvnjVHB12F9sQus
         7jNwcwgo975RypcMOtVzKc3CrsS/zIT9mMdhk3+rmnMewgvjiQMtyn/Xk4PZBBe0DgjY
         r14Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=am4IR8zJFynKb/K2wWAmEX2+wx5hCrSnGiqoHiW7rxA=;
        b=rGF7gm4GJRRoBA2/1OKeXkms7Cqq2VyoVlqCvgLsuivuSZ3WbF2xoDd8G7cKKMP6IX
         TsIvB4B9r4PTZhCDJ3W3rn8xZHI9m1QGfUmaFs4WqPX7zMWCZB7SEU9yYCLcQxtcyYRu
         aDtSn5G6BIl6TDPlcaWrAQpekswYsegDrbR8pmzvc1kPiz4dPYLEW+McoKLSmozPhnt2
         xd4dR6l6rQAc+LpXnBlwscpYWXbXbzkWgDqfTeSBr5FTeUoO2AzFTeUccIx8WkpKcep5
         mvRZas6s1BB+Lx0BeViZ6h1/tNoo/vYTq8CF0rKJFttO7MwnjVN8yqoipxpORSSpBN/n
         xxyA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=t5SgWXQK;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id mv5si1112918pjb.0.2020.03.09.04.24.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Mar 2020 04:24:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 029BODxB122646;
	Mon, 9 Mar 2020 06:24:13 -0500
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 029BODFO031088
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Mar 2020 06:24:13 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 9 Mar
 2020 06:24:13 -0500
Received: from localhost.localdomain (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 9 Mar 2020 06:24:13 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 029BOBYk078381;
	Mon, 9 Mar 2020 06:24:11 -0500
Subject: Re: ivhsmem_uio driver update
To: Jan Kiszka <jan.kiszka@siemens.com>, <henning.schild@siemens.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        "Vutla,
 Lokesh" <lokeshvutla@ti.com>
References: <7c89b273-d0a7-706c-651f-6e658933d93c@ti.com>
 <be05da3a-bd66-b51a-7cd2-53685582de54@siemens.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <5e63fd55-8606-3046-a2cf-2ba8efc80203@ti.com>
Date: Mon, 9 Mar 2020 16:52:28 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <be05da3a-bd66-b51a-7cd2-53685582de54@siemens.com>
Content-Type: multipart/alternative;
	boundary="------------C193D973551CD62AF8DBE0D1"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=t5SgWXQK;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted
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

--------------C193D973551CD62AF8DBE0D1
Content-Type: text/plain; charset="UTF-8"; format=flowed



On 09/03/20 4:39 pm, Jan Kiszka wrote:
> On 09.03.20 11:12, Nikhil Devshatwar wrote:
>> Hi Henning,
>>
>> As part of the TI SDK, we were integrating the ivhsmem_uio as 
>> external module
>> from https://github.com/henning-schild-work/ivshmem-guest-code
>>
>> Since the ivshmem changes in the Jailhouse, that driver no more works 
>> (because of the vendor ID change)
>> Do you plan to host the updated version of the driver in this repo?
>>
>> I know that the driver is already part of the siemens repo but it is 
>> much simpler to integrate an external module in yocto.
>
> Actually, that new driver is a complete rewrite, not just an ID 
> update. It allows to securely pass access to unprivileged users and 
> provides all features of the new ivshmem interface.
Got it
> For that, it requires to patch the kernel with [1]. But given that you 
> have to patch your kernel anyway for other Jailhouse details and given 
> that this is trivial in yocto, I don't get the point of having an 
> external module package being easier.
Sure, I wasn't aware of this dependency.

Regards,
Nikhil D
>
> Jan
>
> [1] 
> http://git.kiszka.org/?p=linux.git;a=commitdiff;h=651db1cf858dd7afef7ef98c7db86223c1f73a59;hp=2c523b344dfa65a3738e7039832044aa133c75fb
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5e63fd55-8606-3046-a2cf-2ba8efc80203%40ti.com.

--------------C193D973551CD62AF8DBE0D1
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
    <div class=3D"moz-cite-prefix">On 09/03/20 4:39 pm, Jan Kiszka wrote:<b=
r>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:be05da3a-bd66-b51a-7cd2-53685582de54@siemens.com">On
      09.03.20 11:12, Nikhil Devshatwar wrote:
      <br>
      <blockquote type=3D"cite">Hi Henning,
        <br>
        <br>
        As part of the TI SDK, we were integrating the ivhsmem_uio as
        external module
        <br>
        from <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/=
henning-schild-work/ivshmem-guest-code">https://github.com/henning-schild-w=
ork/ivshmem-guest-code</a>
        <br>
        <br>
        Since the ivshmem changes in the Jailhouse, that driver no more
        works (because of the vendor ID change)
        <br>
        Do you plan to host the updated version of the driver in this
        repo?
        <br>
        <br>
        I know that the driver is already part of the siemens repo but
        it is much simpler to integrate an external module in yocto.
        <br>
      </blockquote>
      <br>
      Actually, that new driver is a complete rewrite, not just an ID
      update. It allows to securely pass access to unprivileged users
      and provides all features of the new ivshmem interface.</blockquote>
    Got it<br>
    <blockquote type=3D"cite"
      cite=3D"mid:be05da3a-bd66-b51a-7cd2-53685582de54@siemens.com">For
      that, it requires to patch the kernel with [1]. But given that you
      have to patch your kernel anyway for other Jailhouse details and
      given that this is trivial in yocto, I don't get the point of
      having an external module package being easier.
      <br>
    </blockquote>
    Sure, I wasn't aware of this dependency.<br>
    <br>
    Regards,<br>
    Nikhil D<br>
    <blockquote type=3D"cite"
      cite=3D"mid:be05da3a-bd66-b51a-7cd2-53685582de54@siemens.com">
      <br>
      Jan
      <br>
      <br>
      [1]
<a class=3D"moz-txt-link-freetext" href=3D"http://git.kiszka.org/?p=3Dlinux=
.git;a=3Dcommitdiff;h=3D651db1cf858dd7afef7ef98c7db86223c1f73a59;hp=3D2c523=
b344dfa65a3738e7039832044aa133c75fb">http://git.kiszka.org/?p=3Dlinux.git;a=
=3Dcommitdiff;h=3D651db1cf858dd7afef7ef98c7db86223c1f73a59;hp=3D2c523b344df=
a65a3738e7039832044aa133c75fb</a><br>
      <br>
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
om/d/msgid/jailhouse-dev/5e63fd55-8606-3046-a2cf-2ba8efc80203%40ti.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/5e63fd55-8606-3046-a2cf-2ba8efc80203%40ti.com</a>.<br />

--------------C193D973551CD62AF8DBE0D1--
