Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBUESS74AKGQEMM6KALA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 939A82188EC
	for <lists+jailhouse-dev@lfdr.de>; Wed,  8 Jul 2020 15:25:36 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id z1sf22182952wrn.18
        for <lists+jailhouse-dev@lfdr.de>; Wed, 08 Jul 2020 06:25:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1594214736; cv=pass;
        d=google.com; s=arc-20160816;
        b=sjr6z2ktAwCbyj2IaUAyOTNUcaSe5l8bVYIyUaieZjepL2l/AbMTVztP2wDOtbSs5e
         JnQFy3BzHj89aDXnKbV0QlaLkZtptK7lgdP03Pv29nKHAmfkJpZ5IOiU0TZU9OhWjCit
         UOYIqYCQ/JSOI0jDWgPh+wi8ODzUFht1RpavAarj4OgH2F6nY5kCfHCj9Z7LCak5V6a/
         WRxmpU3K6BS0WTLmJ6AdtxaXMucdzaUhmlR+fknTPEIvseKlydxXk5ApvmA0Hxi30VVM
         khszbpt/Inz18WIaGl+GBuWEvWcPpDWpounPjYD7hvwJiekXeN8OTtLmrCrxm8wjTcDb
         MTuw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=IphPKfp6Zafww95hdKeHdaGh3k5vI+Ua/FenNLZLDzo=;
        b=klFfZTly7dI2uvtB2YyCGeaWdousyI+8uDJM1yxBW4U/2v/Kl5/jet0ivrLzDaoSSp
         4Sw2vWD+qQyrTuaARUc+3VQDWKRG79JD5N68eVw5ctqf7uWV6rPn0Vpdv1EIPLrZrf+E
         utMGE51jZzACsQppy16fge9v03Mp4Bw/tTwjUVRyQxC+9SewdZLFJtpUCSaKg/d2Z7Id
         W9qInNugzaDoGh/BlUZhf8aLWshHNOaiDDL2vmmEwfflkG/M7XvOZyrvd+LWa06dYSud
         23CsHGQkUpXH7L8u/xuGgRu9XOsshXhYqpt6gm16324nuRmqdPL3jGe/0a8mJDBibsSV
         GI1g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IphPKfp6Zafww95hdKeHdaGh3k5vI+Ua/FenNLZLDzo=;
        b=qkD88aas5nQbPKeEBv1w/uCbpZNzpYb8L7yMQg3Pbq6PA79oJjILqAbcU8N31C3zvZ
         50eqcs+R0kh+IfCgpZce6JpzWvQt2nPVcVF86m2NEz6ShAIg016LKRS+V2JmNxUFrgep
         x4FKJMc93BycwGDH1f3KstsXYVnjy01gogIHVvz6e338c+6KsKOfjOJLKOVo50fW9FJ3
         jTka0uYs/uJDiplkzPgyYMqpVcjiHcPe2sZ2cXmPLziXAx96otDP0q1VI38d+bFb4ASQ
         Iy+qAMwhCrQSh0JIz/NsIVaaNenJ8Gard9djzAsdoJ8jfJjn5829ugYVlzTQxTNnxT2/
         VTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IphPKfp6Zafww95hdKeHdaGh3k5vI+Ua/FenNLZLDzo=;
        b=OFD/EekTJmzz+6BVZRvR5XFy8drWSjiI+GE5SUeTOibF85CmcPgnf+KFR+AjMobCYF
         4kH0VJDBMR3zIN5JH0hvMaJzjrQlERCBMhdrmFEmg1h5xCZCxNgshztTTV3tEZ0BIF0v
         s3Cke+ul558vZmQSBbELxCwm765WoPReSpxpGwWm04Q7bIMRSkVhKcSzZeIO0ybAiEV0
         SpdL4SaLMYhPmsecxGLsPHTVFd6bU86OgWxVUC9D2Uksqx7rLig46w4Wlz1DgnMKV2xy
         eSUMYc1kmlpRTNdD5r6lUAHSBAtKjlLBHGb+ZGz7Mjp3ztmr5qeWnCjcENLs/EZb02Cr
         ftow==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532pd2z/BasVcJFp7+i4jIJG0uuQNyxCRpplHPeZR3JRYkpHLGaS
	L70Op6lJTyoAv8BGVbRA3FY=
X-Google-Smtp-Source: ABdhPJyhTM5qgKCmgnQ82Bopuc9bBxlW3mvdRRk2f3Lp3CZMXcVhbmQlAwopGoO8Tk12TauTYV2YvA==
X-Received: by 2002:a05:600c:2154:: with SMTP id v20mr10136613wml.185.1594214736285;
        Wed, 08 Jul 2020 06:25:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6507:: with SMTP id x7ls1392567wru.0.gmail; Wed, 08 Jul
 2020 06:25:35 -0700 (PDT)
X-Received: by 2002:adf:ec4e:: with SMTP id w14mr61922767wrn.280.1594214735625;
        Wed, 08 Jul 2020 06:25:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594214735; cv=none;
        d=google.com; s=arc-20160816;
        b=ysuPr+HNPX0mxGITFm9ql/0ZYDtYIOSYqnYSDKonpF9ul6lliMP9cbVACbAf0jpyig
         U9C/UQe2LZk9hJCxM1CqZY8R2nmPHO3T4UeUL4rY2OjL1LXylhJTz5gfh72tlOglKKx+
         a4IkGvmNMAmlSuHHhsDAlCVeQ5QKVpqM9TF8aT7dv0BRfSvXEZtTa0mqV9TtV0d9B+ts
         Ukk+dVZrG6hZS5T+WXoC87ZyHMrcCTQhHSoWgLEJ0SwY3jfwcqW4cnIQDkl+QyzW8u3P
         cc7Jdm/eH9CwfxbnMIZNLxeBfnIIHJDUEWz68o6Yd3w4oSGvoH8neDXQSv8y6H38CCKe
         XWaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=PMASDZVieoGxWHXmtoeq2zTvfjoJaNghAeSwef33iH4=;
        b=IzYJBZQwoZmBvLa/kUsfW/P2o3W/VdGtz2F3T1YqjrxP/RoRF/OSUUPZRAbCjTCJm6
         03CrOT2pem1FmD/Qx4fkXIT/yYb21pM69eaxvDsODFXqHOxmbVNi/jXXJdmyKBYYU4/a
         MEuYTfjhE5NgzA08IHN3laWGo9imcZmy/jfVr7rntNfe+drw7VGG0881wXswQ8VdaC+G
         dHXHu2U+TFHXrHFql5kl/EWFmdfVP3T5oimfS1fI7fa2upwd4hJi9oYOUNani57THT3b
         fjQVgKzzbuEB8GV+oEknX3bgK7iBfyBjTzBCe5aBR2Nwg52/7KF3777fdvESVDGnbDKj
         XQsg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id f143si220654wmf.1.2020.07.08.06.25.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Jul 2020 06:25:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 068DPYCk000869
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jul 2020 15:25:34 +0200
Received: from md1za8fc.ad001.siemens.net ([167.87.28.133])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 068DPY74026450;
	Wed, 8 Jul 2020 15:25:34 +0200
Date: Wed, 8 Jul 2020 15:25:31 +0200
From: Henning Schild <henning.schild@siemens.com>
To: Chung-Fan Yang <sonic.tw.tp@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: License of custom cell configs
Message-ID: <20200708152531.25e804b0@md1za8fc.ad001.siemens.net>
In-Reply-To: <d88a71e3-1269-42f6-93d4-6f66658e5da6o@googlegroups.com>
References: <d88a71e3-1269-42f6-93d4-6f66658e5da6o@googlegroups.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass
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

Hi,

On Wed, 8 Jul 2020 04:49:38 -0700 (PDT)
Chung-Fan Yang <sonic.tw.tp@gmail.com> wrote:

> Hi, 
> 
> I want to ask a silly question.

Not silly, valid!

> Is there any restrictions on the cell configs source files, including
> those hand crafted and these generated by jailhouse command line tool
> ?

Kind of, you basically can choose between GPLv2 and BSD.

> For a hand crafted configs, may I distributed them with the licenses
> as I wish?

You will very likely have to include a header that imposes one of the
two mentioned above.

> On the other hand for generated configs, I noticed that they have BSD 
> headers, so I must comply and following that, right?

I guess you could write the header yourself if you really did want to
choose your own license. And even then ... the format is well defined so
it is pretty clear what the config source says from just looking at the
binary.
So if you plan to protect something ... say IP. You might be able to do
that with the syntax but not the semantics.

Henning

> BR,
> 
> Yang.
> 
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200708152531.25e804b0%40md1za8fc.ad001.siemens.net.
