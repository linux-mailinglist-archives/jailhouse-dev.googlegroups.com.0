Return-Path: <jailhouse-dev+bncBCW3RFO4ZUCRBR5RRPVAKGQEVNQ2AOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x237.google.com (mail-oi1-x237.google.com [IPv6:2607:f8b0:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFB37DB37
	for <lists+jailhouse-dev@lfdr.de>; Thu,  1 Aug 2019 14:19:22 +0200 (CEST)
Received: by mail-oi1-x237.google.com with SMTP id v72sf27770432oia.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 01 Aug 2019 05:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=t40MDBKX2ux9KWEqTTND8OfHTGIF9YCtvJgxYHrZA7M=;
        b=FXPcg2286+lmjSNTRiKmnL/BenKtQD5SK1AiJ/ZDHEBA2LGXsEaC+1D3MtITIJxLtH
         xmmdNo3ReEXI86XzmZ9/T9nbuaOPJIeC546MbOzweySzxPPxl8uTLDi1CG7dlHFZ8xc+
         KnFMbnrB4J4M8O08rWcs0cyECgOEHsJkKaJB3E5EGGM86AwBjK41SiC8j2K3M1XV1d+q
         3SNbup4/5w84k7+SvgGHRy8En23NgCpr7Fcm7mU2Tx84pG07WmOJ13dZ9uB76PgaFL4o
         c7gz6KHeB5eJPvZdh49oxsingvYfrOLM+rhmOiRApHBZJVkzZxFU2D6iEllRIlMmR9u/
         3V5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=t40MDBKX2ux9KWEqTTND8OfHTGIF9YCtvJgxYHrZA7M=;
        b=p3x5YyicIxlnzjvTZkJ94z3qiObD3B7ZiXwyC0piuV5cLl5O3CVq5YUvXfaiV98jxx
         KmmFw7w4Te79WLSzUxdmwq/XsOoR+fJHCHcolcXfgumPL76rntwt3LnFJ9eTrHHb3JRL
         Ketp2hMZz3V9TdQR7UgS5jX+VUgElL7Ry7SVaimRRb+V4w3tL2Py59A/11dPrL22gQRE
         J+4Kvy/IhmZEvY3RJRR3y1pnv8XKL/rqfddOPIro3BXTGxqbtMcMLxG4Y7IQs4PI3Rqk
         JggkMrbxCeIRkvU+tbcyOKkZPiF+71406MQ9vDG1e9J0GWBg4/uhmlvn+NOPuocTpuho
         7pqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=t40MDBKX2ux9KWEqTTND8OfHTGIF9YCtvJgxYHrZA7M=;
        b=jz7MQ3Dv5ANY48cnFhH7S0U4SY6sajnQnfFllAem+TqWl50LWzWLkcjUAlpCBwtp9L
         wH8L7Z7JF05WkV7jr3NQ3i0YxD9Bdq8ZGvHncketf8ja7DqMUs32CT3iHamUQlH2br/r
         gKVYNkq7wvlz8Tri/IjqBoXDQZhJTcd0jC3ITF0E06KhmMS4ULZgqraMvHcKHRv9f6Tt
         xHFM/w/zRPFykhZBl561K1AlRYvRJZQNiXF9vDPdFGLPAyaLBK6azaOlhz4plWaIW9N9
         vQi+nxxJ0HkyXVr9j25Zx9uJYbCLUS7fXgmRYSd1fRSfsUQl23whuc5rUi3CAb3i57R+
         PK9A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAULnp8uyG1w4y8F+5RhJHn/E/PERwLMBNp7sBQmhFfKRxdAjRrD
	Nv+4xgnAHzOfee7XEBZSVAc=
X-Google-Smtp-Source: APXvYqx1V8PgjcWs14Snl95D0QZNEdXzo5g9xplztR5hELKZrZBBU8s3TMb+5lytEMrWKnXWWFi/kA==
X-Received: by 2002:aca:d648:: with SMTP id n69mr66466512oig.46.1564661959973;
        Thu, 01 Aug 2019 05:19:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:eea:: with SMTP id 97ls14382389otj.13.gmail; Thu, 01 Aug
 2019 05:19:19 -0700 (PDT)
X-Received: by 2002:a9d:61d8:: with SMTP id h24mr33824364otk.53.1564661959385;
        Thu, 01 Aug 2019 05:19:19 -0700 (PDT)
Date: Thu, 1 Aug 2019 05:19:18 -0700 (PDT)
From: sebastiansaueressig@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <58f69691-ae83-41a5-816d-7aa15753d781@googlegroups.com>
In-Reply-To: <8ea6b608-7cdf-87b9-3179-da3262348090@siemens.com>
References: <eac59b7f-0f8a-447b-89d4-24f933319910@googlegroups.com>
 <8ea6b608-7cdf-87b9-3179-da3262348090@siemens.com>
Subject: Re: Disable RTC
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_206_447188964.1564661958749"
X-Original-Sender: SebastianSaueressig@gmail.com
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

------=_Part_206_447188964.1564661958749
Content-Type: multipart/alternative; 
	boundary="----=_Part_207_1153155188.1564661958749"

------=_Part_207_1153155188.1564661958749
Content-Type: text/plain; charset="UTF-8"

Thanks for the quick answer.

I haven't found anything either, but I'll update this section if I find 
anything.

Sebastian

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/58f69691-ae83-41a5-816d-7aa15753d781%40googlegroups.com.

------=_Part_207_1153155188.1564661958749
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the quick answer.<br><br>I haven&#39;t found an=
ything either, but I&#39;ll update this section if I find anything.<br><br>=
Sebastian<br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/58f69691-ae83-41a5-816d-7aa15753d781%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/58f69691-ae83-41a5-816d-7aa15753d781%40googlegroups.com<=
/a>.<br />

------=_Part_207_1153155188.1564661958749--

------=_Part_206_447188964.1564661958749--
