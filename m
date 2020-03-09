Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB3FNTDZQKGQEPJYPPHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43a.google.com (mail-pf1-x43a.google.com [IPv6:2607:f8b0:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED3717DD06
	for <lists+jailhouse-dev@lfdr.de>; Mon,  9 Mar 2020 11:14:06 +0100 (CET)
Received: by mail-pf1-x43a.google.com with SMTP id u84sf6496259pfc.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 09 Mar 2020 03:14:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1583748845; cv=pass;
        d=google.com; s=arc-20160816;
        b=e7pozgn9kInCRbfezQmyxvla+quAmBtTy7l30yXf7X8BMuvK5bjmH0IG0FtmsMeNrg
         epzQ+4jwmLl53okdICWauSrBlklJiXpRT+QIxa5M3FnwrzfEJaQnLINkNWglJUiuqibI
         NIyFbXJzWR1+lY+lpGVjHOqWDoWmTjd6SgKj6NGXMKsnH637iW1lC2LYD+zFb42JtxwC
         m8mI99WPF4RXDw5Nl5rU3TxjIG8SSEPVHZTsYImpjgVain67Q6v733mdUkWZ/F+h/6vv
         E755zVJFipINpB12bOgViX7KQu/ZoFG6/I8BLMCu7FHHnSalXNIY5cX2nDvXhdklm8Uj
         yLRw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :mime-version:user-agent:date:message-id:subject:from:cc:to
         :dkim-signature;
        bh=vmoVw1dYH+JLm2fuV4jamRczp/A519u4fWcgMdW29BE=;
        b=dxyKXzRKsld0Da2gtmQi5dXqfc3XFFYYRO3PUW43vMSHtlMG9BuMRobh89+UpVolRy
         lrYn21zcxTdn2MschqAEOClRPI7Flje95l/us+bR9t/+WWAOAGp6weGoMiwSD8eUIOux
         sZ4/thbxDAZB8boJ/lu9rNQzzcZVuLiZIMzh0Pf8MGKogSVM06RTKtZF29uBD1jI1IE5
         IwBifmn6R9PLnaUHBEp4Hflj/KwtqdFf93zJFGKaQkbnSeEzsdUNpTxp+M+43ezz7laj
         FjxegDX7oPEQwS5ezDHzV8AET7orgr+onzdP3mOqDFFWw5KmHKxx/DH4PqyLcdq3Wq/o
         6buw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nI3qeG6p;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=vmoVw1dYH+JLm2fuV4jamRczp/A519u4fWcgMdW29BE=;
        b=pF6vnc3fqi0vJrNEHmizNmZ0NzLCU9J7mDz1RH55uUK8xqbK4Na83NHbcnD/PuXfSy
         If1jG1PHb6z6GRsZPwxUCWKkbJl5adoSoMcyoFPI9izEl6p/LnMV3GoHUuoPRowqbukY
         DZe7ARUFL8c58AHm5II47yEegECxlnw+g2Cz3f39a9UViHpELLbuY99l9dFKSu2cXtsS
         f1ZYs0ZTbJHv/8VPPN2mgJH/ruouy1us4zH701ZMHqB30S0BSch8jFsWDEilCtW2n2Gf
         IGJoNkZlAn9YNDJgAhoNoqVrBlrHtEhImQAKV1zrFuzunFXm002I8uKjWJMROp8Fr93s
         H/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vmoVw1dYH+JLm2fuV4jamRczp/A519u4fWcgMdW29BE=;
        b=d3TLhtconiohqR92sgKcmUq05mEbdMZ9ZwzFTPvwqPHqTZLSkQ/OKFCDPB6CQbfpws
         yL50BGrYrOIsWgNndb858fwz6UHEe1GAyx9JbhZn47lKdpn9Jm5ozEwhwQY5V4r8mH8m
         T9RfHZuq6ymbnIWOCb4nvf9H3ht3sYvlMUOthIMo0DVGQcej1HwqF1z/jKyymuPlwIxC
         HrnDYlq3VzrJj+PwXe72kb3Z0ygCKgRqk2zl89DzHUrlEaRFxtAZh1/EKq76v20hx85H
         yDS47lraQqoeWx1emN9oN3ZuXQNKeQZOCCMIP2xZwAMseIE/rnM3MvvLnwR7sL2HI9eq
         eINg==
X-Gm-Message-State: ANhLgQ1Y1vpBSd0lZGbazc6XLf6zRrTqRIXpDXpSrAyyFpsXCW6CZE8e
	uKhhnjlcoY+zJ4k7fhW0t8o=
X-Google-Smtp-Source: ADFU+vuYkIr6TJEnmnFSCtu9Qwhb81Xp9+EKWoSbul9gf5QvTuSU38NFKsjnh3s1+ZLyt3TicvVv8w==
X-Received: by 2002:a17:90a:30cf:: with SMTP id h73mr13261159pjb.189.1583748844979;
        Mon, 09 Mar 2020 03:14:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:982:: with SMTP id 2ls1162227pjo.1.gmail; Mon, 09
 Mar 2020 03:14:04 -0700 (PDT)
X-Received: by 2002:a17:902:a706:: with SMTP id w6mr15528776plq.79.1583748844374;
        Mon, 09 Mar 2020 03:14:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583748844; cv=none;
        d=google.com; s=arc-20160816;
        b=u6hAxFMr0RSh/7oRSamqttFJMClxsxKFmCfPMwDs6qDPIvUgQm1z4+lOzG62ScFmqV
         x89MTXoDFZgF96mivwAqMjoh8bd6H93l7X/e/ABczo1PlGHDmmm2CtKsJLcNgCd0ssmf
         KhFMj5oegRSUIzAnWgx6uFaaudDFJz/F3gZXCGTAcVCse08PJ7cMsnwYXfQdpu1cUJHW
         KtILfY8TdTi7zsLrkreL3Hike6aFaroo9JCXkjt6XRkmYCucZioNXVkazm1/rbY2gk2I
         njpRUwPCZlbrQxMo66uZIMqanDRjPGLs1kWCcJsr1Y2XWo3olwL2ZItHegkTxqlcVubN
         BuBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:mime-version:user-agent:date:message-id:subject
         :from:cc:to:dkim-signature;
        bh=EQnTNd0bAaggsofjR5dVIkSitfPMlPVU/NMm10zmtFI=;
        b=KQOlLHaDyXBfEBT6vYk74tOSWYDa9f5B0wPmRZH/TjhOeWW9DhtK2lP1klLv8xP7NV
         yGH0npjkSsiyje7l7FJeVhWjqwxa/RKJIW8kPCL2JTL5IpeSTDjLqSbUEjEXPihtKygg
         beKGQqmiE7jkw55ReBH5UiAphXe1ZBFjapFmQ67nkA+s/gXsw3agVXjEK6H5PVqllLIZ
         s8k56CNrie8AI8aOzRpjubyahae32oXJc2xKj0mHNcMO5eOp/Xkbmu6gmhe+xfZ0r4us
         IglsyqJoSOiz03UQnSxsTLxqFdo+pewJAtmWWnLJnuI9OByTlwtOL6Ttr6F5qFfP3yPx
         Wv/g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nI3qeG6p;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id l12si498228plt.5.2020.03.09.03.14.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Mar 2020 03:14:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 029AE3Y5056938;
	Mon, 9 Mar 2020 05:14:03 -0500
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 029AE3QT120810;
	Mon, 9 Mar 2020 05:14:03 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 9 Mar
 2020 05:14:01 -0500
Received: from localhost.localdomain (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 9 Mar 2020 05:14:01 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 029ADx1F086066;
	Mon, 9 Mar 2020 05:14:00 -0500
To: <henning.schild@siemens.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        Jan
 Kiszka <jan.kiszka@siemens.com>,
        "Vutla, Lokesh" <lokeshvutla@ti.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Subject: ivhsmem_uio driver update
Message-ID: <7c89b273-d0a7-706c-651f-6e658933d93c@ti.com>
Date: Mon, 9 Mar 2020 15:42:17 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="------------CF65CA0AF2565EF36E718C6E"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=nI3qeG6p;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted
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

--------------CF65CA0AF2565EF36E718C6E
Content-Type: text/plain; charset="UTF-8"; format=flowed

Hi Henning,

As part of the TI SDK, we were integrating the ivhsmem_uio as external 
module
from https://github.com/henning-schild-work/ivshmem-guest-code

Since the ivshmem changes in the Jailhouse, that driver no more works 
(because of the vendor ID change)
Do you plan to host the updated version of the driver in this repo?

I know that the driver is already part of the siemens repo but it is 
much simpler to integrate an external module in yocto.

Thanks & Regards,
Nikhil D

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7c89b273-d0a7-706c-651f-6e658933d93c%40ti.com.

--------------CF65CA0AF2565EF36E718C6E
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <font face=3D"Verdana">Hi Henning,<br>
      <br>
      As part of the TI SDK, we were integrating the ivhsmem_uio as
      external module<br>
      from <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/he=
nning-schild-work/ivshmem-guest-code">https://github.com/henning-schild-wor=
k/ivshmem-guest-code</a><br>
      <br>
      Since the ivshmem changes in the Jailhouse, that driver no more
      works (because of the vendor ID change)<br>
      Do you plan to host the updated version of the driver in this
      repo?<br>
      <br>
      I know that the driver is already part of the siemens repo but it
      is much simpler to integrate an external module in yocto.<br>
      <br>
      Thanks &amp; Regards,<br>
      Nikhil D<br>
    </font>
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
om/d/msgid/jailhouse-dev/7c89b273-d0a7-706c-651f-6e658933d93c%40ti.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/7c89b273-d0a7-706c-651f-6e658933d93c%40ti.com</a>.<br />

--------------CF65CA0AF2565EF36E718C6E--
