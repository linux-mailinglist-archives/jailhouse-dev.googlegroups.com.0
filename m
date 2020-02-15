Return-Path: <jailhouse-dev+bncBCDJXM4674ERBUXMUDZAKGQELRYPCVI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x338.google.com (mail-ot1-x338.google.com [IPv6:2607:f8b0:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 0495815FFA3
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 19:20:04 +0100 (CET)
Received: by mail-ot1-x338.google.com with SMTP id t10sf7465923otc.9
        for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 10:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GXv13jejBIeHoG4Qeantk2sCbWXruzcP0OjBEIX97qA=;
        b=eDzeciu+DiAXbAeOoJjqaLDJKp9X7HDPdr+6fN6OjNVEAJiGMXxqh7Te7U5rryXg0L
         pe/q0udf2k8hz4iulokojQHq/naJKCVtaFbJGHjflhoDsdHeZmt+uUMW9Ey5CivKBo+M
         Rpi2vEdn8poqYnrMn3HR8XxP6qQ/t2WIN9qLSM9ABFlrvpygKQDPLaQKUBM56YvE9aXp
         K2Lb0fUqhWnmygQ2kFy45sEcDG6MHCA6aIkou/tqJFZeDshRrOtB7P7+cP1A4iJWs8GK
         G+2tGc6Xlfx2MVzp1SaQe/tk3TJKr9S+VzOd78IFTy97d/lwdbxh586xPlScUEDk0l48
         +m/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GXv13jejBIeHoG4Qeantk2sCbWXruzcP0OjBEIX97qA=;
        b=M4ozpdqg/lcYnEmdO4or2LXqEZ3bhiefTTww4jl9YKHAD+kR2LYFZ/92Nrk+OlZhGm
         rJKal1B+WGNEfbfdmH3FPQmGDzwyScEsZHz3xHGeB4UP+S+oqguMdL0TdR9HkpJiF7aQ
         7FK+uRZk5zYgf13jC8g2kmmFKB/qbmsCSyz/T+eLzEgPCJhgKp5/x6gxswjky/HcXlPH
         SY8EEi26p4c0EFuefg6oGxaF7NHZnAo9XeJsbordfcQonmC9TmnkOIZcV6Qiy0FgLtkn
         +RRubaSbqZ9odU7FaiRfVxzSlcv2HMqz7fsEaekV3Zghsdp59LsPMUcum5jxA92uy+F+
         bj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=GXv13jejBIeHoG4Qeantk2sCbWXruzcP0OjBEIX97qA=;
        b=qy55sdV0mNVb9KFWpizFrchz5NMie9AcoaZTYNUOIFp0pUZiDIdKRC9dR/7GZn2x7v
         fS4eX3z7SbrtgVTVK8ZFJTpM/CxU9BDFadweKKThvHFZDofQyJPZsRYJw4xqGZNTEcrT
         2ScPM9u+05wOmhrIFPHZTafDzsJFPQnbKIqJjCqw5JH2xfc/GDeCQWRkIV5BNVbxRvkX
         oU/dIDfbppuXgls43je1djBQaDRMcMRI1mHsodPh+AwEYFGkf9RJSFmEhlirTN6dKQkl
         RIjm6b+tufxlg0NkNdWOVMvLEuBbJxWQ0WLpQ8p5ODtBW4l/akHcyb5bbXRPWn8+AVAP
         m+Mw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXDVpHjd2rRWG7DTwqFC9M0Bow4MOh759AubWsKJRXXhhbo9lS+
	Tbv8mnvY9alwP1N1Gka4Qu4=
X-Google-Smtp-Source: APXvYqy11uLOyZv6IXxiArhamY8TvA19Fzzbd0Ztt4IE0RaU/M+tU6I10ZTzUGizLN45Mq/ACLb8bw==
X-Received: by 2002:a9d:6b84:: with SMTP id b4mr6789474otq.190.1581790802391;
        Sat, 15 Feb 2020 10:20:02 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:7999:: with SMTP id h25ls2047otm.2.gmail; Sat, 15 Feb
 2020 10:20:01 -0800 (PST)
X-Received: by 2002:a9d:6418:: with SMTP id h24mr6684956otl.172.1581790801768;
        Sat, 15 Feb 2020 10:20:01 -0800 (PST)
Date: Sat, 15 Feb 2020 10:20:00 -0800 (PST)
From: Michael Hinton <michael.g.hinton@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <6de14a31-40dd-4f7d-bfac-b3d83d959b70@googlegroups.com>
In-Reply-To: <05da8dd6-13c2-ea3a-b91b-3fb4e5114238@web.de>
References: <0d86ac87-9d3c-42c4-b499-af40aa76d302@googlegroups.com>
 <eae57764-d282-e692-f113-b3360c6a06ad@web.de>
 <7562e73e-cfc3-4df8-8ce2-8986f903d44b@googlegroups.com>
 <05da8dd6-13c2-ea3a-b91b-3fb4e5114238@web.de>
Subject: Re: Strange newlines for console output
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3943_1931592177.1581790801154"
X-Original-Sender: Michael.G.Hinton@gmail.com
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

------=_Part_3943_1931592177.1581790801154
Content-Type: multipart/alternative; 
	boundary="----=_Part_3944_1144530281.1581790801154"

------=_Part_3944_1144530281.1581790801154
Content-Type: text/plain; charset="UTF-8"

On Saturday, February 15, 2020 at 7:30:48 AM UTC-7, Jan Kiszka wrote:
>
> Yeah, was nonsense. The version in next is better. 
>
> Jan 
>
Perfect! I think that should work. Thanks! 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6de14a31-40dd-4f7d-bfac-b3d83d959b70%40googlegroups.com.

------=_Part_3944_1144530281.1581790801154
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Saturday, February 15, 2020 at 7:30:48 AM UTC-7, Jan Ki=
szka wrote:<blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-left=
: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">Yeah, was nonsense.=
 The version in next is better.
<br>
<br>Jan
<br></blockquote><div>Perfect! I think that should work. Thanks!=C2=A0</div=
></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/6de14a31-40dd-4f7d-bfac-b3d83d959b70%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/6de14a31-40dd-4f7d-bfac-b3d83d959b70%40googlegroups.com<=
/a>.<br />

------=_Part_3944_1144530281.1581790801154--

------=_Part_3943_1931592177.1581790801154--
