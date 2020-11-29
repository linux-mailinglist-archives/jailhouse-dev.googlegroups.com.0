Return-Path: <jailhouse-dev+bncBDC7ZQ52YQBBBYHER77AKGQE7KZAE2I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x138.google.com (mail-il1-x138.google.com [IPv6:2607:f8b0:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EA42C7ADB
	for <lists+jailhouse-dev@lfdr.de>; Sun, 29 Nov 2020 20:11:31 +0100 (CET)
Received: by mail-il1-x138.google.com with SMTP id j8sf8410716ilr.11
        for <lists+jailhouse-dev@lfdr.de>; Sun, 29 Nov 2020 11:11:31 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606677089; cv=pass;
        d=google.com; s=arc-20160816;
        b=bwyu/X6DOPGxn9rsVdzDGEALt/gYIdjqYMYEEXPyptN/nU+74fv0uv3m7MiLGzMuwQ
         vK5eEQ4NvX6XEcegcQIe+O8dkgUIgHql/cvxh8pouLi8QPgWEo+L1NvxywMWIXVfULWm
         b8/2L0ReJZUgHtJhaFGln1PzHmyV98VmBUjDw/Liag/j8rIZL9BZ4GiWTYAZUhgHqkXM
         11A7U4ex7Qi9tgwXHzgpB7YLdLVQIxyE0C5SuXfchTItqfsBtw5ydQIQF4aU6dmZfI3D
         s/zeJHtyAZkiOGbfPTCNDQdka87qkmGcVlNcGmcm3e+71KTz/Jfym6knCEb1vGHOgY2r
         L7HQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:from:subject:date:message-id
         :reply-to:mime-version:sender:dkim-signature:dkim-signature;
        bh=rynZojN/YiAYQPFidSq3qT3kTAiRk1N4etAS2fluPTo=;
        b=R40XJHy/1eFgmdxLVr0zBGdyxZKqSHQ0FCqXxcGVDl1VtNYNfOwwgQ+nj6GNS+KcwZ
         1xH5ZgrUxnsKXqkeC8fFmsQQ8PU5/B1cHi4N3Tenw7VZBmJ2sILONZLMP14N/PEsMcpk
         PWLeQOSu1USVvkWccDapwXohMzH1S4SXnvwD7w+R5SW6Jd2h87tRI4JhguS7VTR8bgpN
         96N0YpCAwjI57pQx1bmaiFXsNS6g9Lq1c9EZuV4jsQJnCAvaO/LWHChUe9HO8/MG+r/R
         wjhw9WK/mptS8y0Tiinur5i6Li21rxxYc2azPKVggcaLd1D6Pxo4Zj5kD/d4nAn1MkgK
         Si4w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZPECGJKR;
       spf=pass (google.com: domain of 3ypldxw4jafk29c1cdfii9jtus7d19c.3fd@trix.bounces.google.com designates 2607:f8b0:4864:20::b47 as permitted sender) smtp.mailfrom=3YPLDXw4JAFk29C1CDFII9JTUS7D19C.3FD@trix.bounces.google.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:reply-to:message-id:date:subject:from:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rynZojN/YiAYQPFidSq3qT3kTAiRk1N4etAS2fluPTo=;
        b=fGG5eMZ9wHWwwb+OA07jWK4LBmsaf4d1b+9jDBS4GAi6wqzHlzBbuh6xQf3XsEEgg9
         flU0oL7OIlSXjPz9ykQkTdsP3Xlh2M2L8DI9XWIzRj287LqEvKB+ZN9AKYqSdas+v6Xb
         ZnofGjM8o9oS9GcwABuF1MFDDqFWdYxJEnDLJP/ZlfcEUqcPZBuEdU79fb3I0bB+K95O
         yPUL8oCvCjD/i1VcclPi81jN/v1rlnE2+gm/GbUbYEdRK4GCMb+1UCrrRGUQ6pjSgiJc
         WKy4mMVErmQrspcqtnKw/b/jS8vboPQjvEcaw1Yx5esViK6Kz4hhNQBmPqgb0NhcX26O
         e5OA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:message-id:date:subject:from:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rynZojN/YiAYQPFidSq3qT3kTAiRk1N4etAS2fluPTo=;
        b=k9P1Y+xWeWgyQiDBOGs0oyOajKVDXzJyOTCMgwSrr5UBfsnqb9adGziofzhhacS2ZV
         35/q9mpEgdhIl6XSy7dwFUYImX00/tqnVT3O6JuXuZ9v/BBrvBwtpZkwIFsKNYOSLv4O
         v4D2VIZoP5awWeSWlXupasXCTsqOTTGXh2T0N2XMgaSzvbgqdoXU2VaLirMuAhnnI9+o
         XwqC0HwhJh0JiCiNL90YHAyZS7XVP00njWf5izet/mjopzLGZyBQPnPQGb8TcrfUq8/L
         Gb4eRC7p/0OtaIktGXZ+qqZTKv738NIL7oV6I+3T2O6E/lllOYh3J3qF7IMedmuSETaj
         virA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:reply-to:message-id:date
         :subject:from:to:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rynZojN/YiAYQPFidSq3qT3kTAiRk1N4etAS2fluPTo=;
        b=d4ExN5qLtB1wgL0MW5fHAhQRHeDJbxZn/Ich49i+EdOCvtnhMAdHDZ84O7Oyz7nkFe
         lyl0FarLDJAoxWkg+4aalE0TTFYWWz8zJHajXtFuSIC8gys/IsWlMWc/8XQZArmAzRdg
         gOxrs1VTwNw2Mls2vLM7Qml5fqtLCd6D6hvR67m7H/f9q+o36xwHkEt1wwdntq8XZQ59
         Ml+3GCIF+fUuo8lnxNHIaqkzOuEtV/jI8Ihdqw3QSBII/bFtjI9VRtXGpwObML8EhGfd
         pvX/8nUX15hMdFhp3YLchsrRhC2o5mkj8EQcyxeikzC9cONBulfsSDr++4EwG2ebn9Ts
         4Hxg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532KM2FvY99U25650UOOoBw1v56SnIBCH9Pj29249YTQaKwuw+Hl
	of+6QSyGbByNDh8bcVewMP4=
X-Google-Smtp-Source: ABdhPJzFIVzWB/ApvRWGgCYwsvlh1TexpBGWwPUviR02zGbKMQRUPe2aChNetlFOOpVdjjhbML4fIA==
X-Received: by 2002:a02:8387:: with SMTP id z7mr15892921jag.129.1606677088987;
        Sun, 29 Nov 2020 11:11:28 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a02:a41:: with SMTP id 62ls1298806jaw.1.gmail; Sun, 29 Nov
 2020 11:11:28 -0800 (PST)
X-Received: by 2002:a02:9469:: with SMTP id a96mr1776417jai.86.1606677088382;
        Sun, 29 Nov 2020 11:11:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606677088; cv=none;
        d=google.com; s=arc-20160816;
        b=bGIHQRFwXd3NG/LLJRNbKdKqPYM1wmxdcOkpEW2+pe7bEGPO8X0iYf/GrhzOYWe87p
         KC+P8Qm7losAhyxTdEYbiWxiW6VnojXG5oIIXj+lDBMUBvfx/F0c5cnqjy0IFNw/nd/g
         t2Z9kzXA+xBx571cqUsfkX2wso0e6soHYKfOjC8v76O8GOlQkfnWOwKJgPOkMvso3uxp
         Um68U0FAdw6MRiRQvKyjI0JyFTYbfHQw8n9kBTDWjTz15nDeZ4vMClqqJ0w+elLUn0JU
         BFR66+qRTMyLGtbfu7mGAT7muR445pEfsFjB7jVH/5OBEheChNkDRT+FQMECli1+j+lE
         MWYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:from:subject:date:message-id:reply-to:mime-version
         :dkim-signature;
        bh=iIi6XQ/3xd6Q47YB/TvcpHPQYuwTWg92+hWZYipuGA4=;
        b=PYt4uDlZbh6/dxM4Nx7lPFtY5OhcfFo2Gt4n06EPyGP/t/hecKb4Rj4rduErgnkvms
         YK7knRuhPURPS2gJx5vks+4VTAHKIjLHOz0vfaskXXfnr0HmSeHKBLf3/PxPujK/qNyU
         IkOgrAAo7D63bq+zdSAZPzRMTt5g7zphYFf+j2yWLCs29y3RBl5oVsmdtPXzEQ0EYMIJ
         Vsue1HcgKDqWv2+C/uvviqMpWLoSeOw5sypc2JkaC6UD3WSgMnYgbveHOke1hzSgiCIK
         m16hPRVOkEiYWFSQqrEv8gFgYsrQuh0R+Q2TXuZugPkKxfZVDGjHQyz8AZna1TkIjY1o
         cA2Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZPECGJKR;
       spf=pass (google.com: domain of 3ypldxw4jafk29c1cdfii9jtus7d19c.3fd@trix.bounces.google.com designates 2607:f8b0:4864:20::b47 as permitted sender) smtp.mailfrom=3YPLDXw4JAFk29C1CDFII9JTUS7D19C.3FD@trix.bounces.google.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yb1-xb47.google.com (mail-yb1-xb47.google.com. [2607:f8b0:4864:20::b47])
        by gmr-mx.google.com with ESMTPS id b14si810685ios.2.2020.11.29.11.11.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Nov 2020 11:11:28 -0800 (PST)
Received-SPF: pass (google.com: domain of 3ypldxw4jafk29c1cdfii9jtus7d19c.3fd@trix.bounces.google.com designates 2607:f8b0:4864:20::b47 as permitted sender) client-ip=2607:f8b0:4864:20::b47;
Received: by mail-yb1-xb47.google.com with SMTP id x129so13074486ybg.12
        for <jailhouse-dev@googlegroups.com>; Sun, 29 Nov 2020 11:11:28 -0800 (PST)
MIME-Version: 1.0
X-Received: by 2002:a25:4c89:: with SMTP id z131mt18213786yba.339.1606677088006;
 Sun, 29 Nov 2020 11:11:28 -0800 (PST)
Reply-To: bilalmorris231@gmail.com
X-No-Auto-Attachment: 1
Message-ID: <00000000000019778b05b543a944@google.com>
Date: Sun, 29 Nov 2020 19:11:28 +0000
Subject: Congratulation! (Mega Millions Lottery)
From: bilalmorris231@gmail.com
To: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="0000000000001af95005b543a981"
X-Original-Sender: bilalmorris231@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=ZPECGJKR;       spf=pass
 (google.com: domain of 3ypldxw4jafk29c1cdfii9jtus7d19c.3fd@trix.bounces.google.com
 designates 2607:f8b0:4864:20::b47 as permitted sender) smtp.mailfrom=3YPLDXw4JAFk29C1CDFII9JTUS7D19C.3FD@trix.bounces.google.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--0000000000001af95005b543a981
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

I've invited you to fill out the following form:
Untitled form

To fill it out, visit:
https://docs.google.com/forms/d/e/1FAIpQLSejitRsY0yrE6F4TILKy0bfmau43DYeveiXnH_uGVxYOKKetw/viewform?vc=0&amp;c=0&amp;w=1&amp;flr=0&amp;usp=mail_form_link

Congratulations You have won $ 850,000.00USD Your E-Mail Name Is Among
the Lucky Winners at Mega Millions Lottery Online promo, Ticket Number
(88910), For more information contact us Via Tel: +44} 7045746552. or
reply to this email: peterjeng042@gmail.com

Your winning reference numbers are PMG / EBD / 850AF and will Instruct you
on claim arrangements for your winning prize.

Please note this, You are only required to forward your Name and your  
Address.

Your Full Name.
Your Age.
Your Country / Home Address.
Your Telephone Number.
Your Occupation.

Thank you and once More Congratulations.

Yours faithfully,
Agent Morris Bilal.
Claims / verification Agent,

Google Forms: Create and analyze surveys.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/00000000000019778b05b543a944%40google.com.

--0000000000001af95005b543a981
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><body style=3D"font-family: Roboto,Helvetica,Arial,sans-serif; margin=
: 0; padding: 0; height: 100%; width: 100%;"><table border=3D"0" cellpaddin=
g=3D"0" cellspacing=3D"0" style=3D"background-color:rgb(103,58,183);" width=
=3D"100%" role=3D"presentation"><tbody><tr height=3D"64px"><td style=3D"pad=
ding: 0 24px;"><img alt=3D"Google Forms" height=3D"26px" style=3D"display: =
inline-block; margin: 0; vertical-align: middle;" width=3D"143px" src=3D"ht=
tps://www.gstatic.com/docs/forms/google_forms_logo_lockup_white_2x.png"></t=
d></tr></tbody></table><div style=3D"padding: 24px; background-color:rgb(23=
7,231,246)"><div align=3D"center" style=3D"background-color: #fff; border-b=
ottom: 1px solid #e0e0e0;margin: 0 auto; max-width: 624px; min-width: 154px=
;padding: 0 24px;"><table align=3D"center" cellpadding=3D"0" cellspacing=3D=
"0" style=3D"background-color: #fff;" width=3D"100%" role=3D"presentation">=
<tbody><tr height=3D"24px"><td></td></tr><tr><td><span style=3D"display: ta=
ble-cell; vertical-align: top; font-size: 13px; line-height: 18px; color: #=
424242;" dir=3D"auto">Congratulations You have won $ 850,000.00USD Your E-M=
ail Name Is Among<br>the Lucky Winners at Mega Millions Lottery Online prom=
o, Ticket Number<br>(88910), For more information contact us Via Tel: +44} =
7045746552. or<br>reply to this email: peterjeng042@gmail.com<br><br>Your w=
inning reference numbers are PMG / EBD / 850AF and will Instruct you<br>on =
claim arrangements for your winning prize.<br><br>Please note this, You are=
 only required to forward your Name and your Address.<br><br>Your Full Name=
.<br>Your Age.<br>Your Country / Home Address.<br>Your Telephone Number.<br=
>Your Occupation.<br><br>Thank you and once More Congratulations.<br><br>Yo=
urs faithfully,<br>Agent Morris Bilal.<br>Claims / verification Agent,</spa=
n></td></tr><tr height=3D"20px"><td></tr><tr style=3D"font-size: 20px; line=
-height: 24px;"><td dir=3D"auto"><a href=3D"https://docs.google.com/forms/d=
/e/1FAIpQLSejitRsY0yrE6F4TILKy0bfmau43DYeveiXnH_uGVxYOKKetw/viewform?vc=3D0=
&amp;c=3D0&amp;w=3D1&amp;flr=3D0&amp;usp=3Dmail_form_link" style=3D"color: =
rgb(103,58,183); text-decoration: none; vertical-align: middle; font-weight=
: 500">Untitled form</a><div itemprop=3D"action" itemscope itemtype=3D"http=
://schema.org/ViewAction"><meta itemprop=3D"url" content=3D"https://docs.go=
ogle.com/forms/d/e/1FAIpQLSejitRsY0yrE6F4TILKy0bfmau43DYeveiXnH_uGVxYOKKetw=
/viewform?vc=3D0&amp;c=3D0&amp;w=3D1&amp;flr=3D0&amp;usp=3Dmail_goto_form">=
<meta itemprop=3D"name" content=3D"Fill out form"></div></td></tr><tr heigh=
t=3D"24px"></tr><tr><td><table border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" width=3D"100%"><tbody><tr><td><a href=3D"https://docs.google.com/for=
ms/d/e/1FAIpQLSejitRsY0yrE6F4TILKy0bfmau43DYeveiXnH_uGVxYOKKetw/viewform?vc=
=3D0&amp;c=3D0&amp;w=3D1&amp;flr=3D0&amp;usp=3Dmail_form_link" style=3D"bor=
der-radius: 3px; box-sizing: border-box; display: inline-block; font-size: =
13px; font-weight: 700; height: 40px; line-height: 40px; padding: 0 24px; t=
ext-align: center; text-decoration: none; text-transform: uppercase; vertic=
al-align: middle; color: #fff; background-color: rgb(103,58,183);" target=
=3D"_blank" rel=3D"noopener">Fill out form</a></td></tr></tbody></table></t=
d></tr><tr height=3D"24px"></tr></tbody></table></div><table align=3D"cente=
r" cellpadding=3D"0" cellspacing=3D"0" style=3D"max-width: 672px; min-width=
: 154px;" width=3D"100%" role=3D"presentation"><tbody><tr height=3D"24px"><=
td></td></tr><tr><td><a href=3D"https://docs.google.com/forms?usp=3Dmail_fo=
rm_link" style=3D"color: #424242; font-size: 13px;">Create your own Google =
Form</a></td></tr></tbody></table></div></body></html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/00000000000019778b05b543a944%40google.com?utm_medi=
um=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailhouse=
-dev/00000000000019778b05b543a944%40google.com</a>.<br />

--0000000000001af95005b543a981--
