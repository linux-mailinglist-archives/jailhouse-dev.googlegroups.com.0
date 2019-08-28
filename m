Return-Path: <jailhouse-dev+bncBCW3RFO4ZUCRBPXTTHVQKGQEUDV7KFI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x339.google.com (mail-ot1-x339.google.com [IPv6:2607:f8b0:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C07EA0249
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Aug 2019 14:55:28 +0200 (CEST)
Received: by mail-ot1-x339.google.com with SMTP id k22sf1247548otn.12
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Aug 2019 05:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=M4yNo3BkrGGrPlipt620ulfLwRWDh7ACMnTs/FZtFPM=;
        b=Hwnc6UmbLXq0vddlJ5kER0GuVRAzYtkgVaRbkVBn52psqWrzNyHjCRTr+6qiHNo4UG
         HgI9DENyi1N8fzEVHQaTjRrF4H0M/VzYVg1TWQ3QzmZG9cCqOCHfPhj2PHwQQLHlv3/F
         984qiUp1l5tJ55Ki4TCrITL8o5PP4CzSGOaA3EfFylOG8bEiwg0neh+tRgLsR9/CxHGu
         2YZRxZOTN4poopeSwfdPimc08Xvk84PJvMZLKOxNsttBxCKC6qNoiVUgKAcBqvMoq8vw
         5kyZBevv9qODcox3uQ1ABX4ijWNpoxZOQfz2DzJnrfkG6TGyQYl+mAbIPfLxBi7rj0au
         esVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=M4yNo3BkrGGrPlipt620ulfLwRWDh7ACMnTs/FZtFPM=;
        b=sIhgMzA1Sw/Pk4Z4/RquPOMolR8Wrc87itBkFRQKF7MRlPWh5iR0SCBTyTY1a3gmR+
         MULOgqWCjQZMQxpzFaTXtbgB6wgTy+ETSoSfVBWPzuhK1RuJBi8tMmD9u7ciqbMvF3ml
         THHMxK/2C7BepQayr31/rvt8De8mOzCht7v0lyAcYDxZJJV7RAj1vsvOBpljybTtrLeN
         YrIUEBsxYRyzSj/AZJdt4CugSQweAI8b+cFWmlNStynV0aJUxPLA0tqIQzEKbm1iEVKz
         pCy+nuvypRtI9mSVVUspSO7ijPT1sfMoi07s8iNXhB+azpV6SnlIiA4WDP8S1LQPnAf0
         jObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=M4yNo3BkrGGrPlipt620ulfLwRWDh7ACMnTs/FZtFPM=;
        b=Xbrcodz8r0DS1cvgENuej717VrH4zeFYjFPy2jCT+vvz2DqC1Qe0IaWOERv1bqq6A8
         fNFNmvyCYGTis6bKE+W0UmtTOOssrJ+B54I1CFoMkvclJp/cSte8dinTDrRY1tMcVx8+
         Zx3mcuIj6urQKuwuBWP9+0yEbm975qlXTTlqFiF8fbJ3bHA1U1zeO+ISdk2TCIqpIV7B
         gjtjVr+VnHW1rMz/pzxQUaYOLSm/ZevmaCI35rQn0QFjr+vOJjTOmOt4CVBh2CfJc0cB
         EAMQ3wc+7E5iSAA1WxLVVxlYE30gIWI/jCcb7/beE+InAhyFWcEDFqdH6F/PMkwEJPX7
         YvHg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUYMVxGFgsApyj9rbaV9YTKJSODyq5PDox31OlfeqcXaPA2QvKg
	muy64xWAdqSyPlXDNr8tYsM=
X-Google-Smtp-Source: APXvYqwcrnUCwk13wYoJTKf4Gs5+Fr20GSEhwzH+qW1bZihofmWiU02VMOk7XX97ony4w1vLpZXDyQ==
X-Received: by 2002:aca:2b08:: with SMTP id i8mr2427709oik.31.1566996926815;
        Wed, 28 Aug 2019 05:55:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:6343:: with SMTP id y3ls401335otk.7.gmail; Wed, 28 Aug
 2019 05:55:26 -0700 (PDT)
X-Received: by 2002:a05:6830:11d7:: with SMTP id v23mr2936880otq.240.1566996926152;
        Wed, 28 Aug 2019 05:55:26 -0700 (PDT)
Date: Wed, 28 Aug 2019 05:55:25 -0700 (PDT)
From: sebastiansaueressig@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <24b3bf52-2c32-4656-ac6c-206407ab97ce@googlegroups.com>
In-Reply-To: <cc58cce9-a377-70f6-fb38-b24a9ba0e210@siemens.com>
References: <3335f4d5-d834-4103-a4fa-45b55164d430@googlegroups.com>
 <cc58cce9-a377-70f6-fb38-b24a9ba0e210@siemens.com>
Subject: Re: Unable to find IVSHMEM pci-device on root cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3239_1143629187.1566996925650"
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

------=_Part_3239_1143629187.1566996925650
Content-Type: multipart/alternative; 
	boundary="----=_Part_3240_2053156519.1566996925651"

------=_Part_3240_2053156519.1566996925651
Content-Type: text/plain; charset="UTF-8"

Hey Jan,
thank you very much, once again!
 
>
> Well, the reason might be that Linux may need a virtual bridge for 
> scanning for 
> a virtual device on bus 3. Try adding the device to bus 0 at a free slot. 
>

This works!
For example (.bdf = 0x30)

Greetings
Sebastian

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/24b3bf52-2c32-4656-ac6c-206407ab97ce%40googlegroups.com.

------=_Part_3240_2053156519.1566996925651
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hey Jan,</div><div>thank you very much, once again!<b=
r></div>=C2=A0<blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-l=
eft: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">Well, the reason=
 might be that Linux may need a virtual bridge for scanning for=20
<br>a virtual device on bus 3. Try adding the device to bus 0 at a free slo=
t.
<br></blockquote><div><br></div><div>This works!</div><div>For example (.bd=
f =3D 0x30)<br><br>Greetings<br>Sebastian<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/24b3bf52-2c32-4656-ac6c-206407ab97ce%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/24b3bf52-2c32-4656-ac6c-206407ab97ce%40googlegroups.com<=
/a>.<br />

------=_Part_3240_2053156519.1566996925651--

------=_Part_3239_1143629187.1566996925650--
