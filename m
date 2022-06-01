Return-Path: <jailhouse-dev+bncBDVP3IWNW4CBBCXW3SKAMGQE7OC2XWQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x840.google.com (mail-qt1-x840.google.com [IPv6:2607:f8b0:4864:20::840])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB9C53A208
	for <lists+jailhouse-dev@lfdr.de>; Wed,  1 Jun 2022 12:10:20 +0200 (CEST)
Received: by mail-qt1-x840.google.com with SMTP id t14-20020a05622a01ce00b002ff91ea4445sf949815qtw.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 01 Jun 2022 03:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ryZU0zdy/KR9TnfVaqScWAIm6ua13ZK8XtXVjHYwHLQ=;
        b=s7N2DJhL9OjmvbmyidSSnGElj5QopPwcbM3rYnzfEWaxQKEaN6r3tE/0PdvOud1RWh
         lEujO6nhHk7K+UzE3xfqWkP9DCtbDjbTKmekWEbESOHG4cP4W69UU7Ezq3j9QJgPau3I
         zTvDpYBZug4xGs0JhQtu2kRTWRc6EOoYYbG/KYuW5Pbv4M14Y1TlfhMDCn4fkCz1hHQ8
         7o+waGN6BBBy5iVJqLy8Ni+F8NnuA3LXE6AfXj1YF3cTd4G6xz6BZWNxtTXaJWERaBTz
         YkDuUkjnqEc320e4pTpZfYa4pru6J/txobz0fN32J981pzO4O+dAu4U4kol1+uIH0SGd
         lMlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ryZU0zdy/KR9TnfVaqScWAIm6ua13ZK8XtXVjHYwHLQ=;
        b=jn7Uykw2BdZObdK8JZkh3OYdSGbiUIMJ7s6rS0Ij3Xt8t+U3DN9aj4LyZwPvQb4pQ/
         oOFtEoiaE2vrHtu1+ISX049s3JG6XHEpb6s+9TgslAWX8AoT40gxZZApovGSCVisiQ0N
         80HxvNo+R9QSuBce/Qiyl8tQyq3fCT/ip9llGpG9zQRxnXP7MIwOMTP6aGSOUdQwCT5U
         QuKPf9e2fycxoC1xbu+CJQWZSA9G3/4hPnUtdf63Ex3bSi/Ihh6MSVaAzsabScsOANHK
         dzf0H6owLblWHwwRJ8J82DBh9M15yDtaYQ79yOaAc50KlS2eim0xg3wSWgPPzC8W7tDK
         405Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ryZU0zdy/KR9TnfVaqScWAIm6ua13ZK8XtXVjHYwHLQ=;
        b=sCmIEsVFpxDoEGDgWQJg1qVTScvo3bxVsPo7QAgTym2J/3MEvMY8BtqOaJPeu/KkAz
         8F7s2qhSveg5dLaU6rfPk7BflmuQe/JpNwpI761QgyeD1X4V7zgiPDQlV1B9qosS5POT
         JDEmykgycPrRuX6ymjpSD1LnN5cfpr9G8+wthIcNzRkRR58kg3p8CWJJhhjaA1jbTpK9
         lgCz493C4ShHSZnwu3HFlkXvf10o++Xke8+4RgZsP0LtrEpEW+rdyisx9RHeA00BwaSE
         wKhhyF9QHzIocxV0tkCYGTDA4Wo3Hkv7ozpAo+1YysBRXbcyLplD8Q+8AGtLgxLx4s+e
         RBJw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Td0Y34ziOR6ptSGiT22W1ojNA98GYWcXBgb9n0tO0Sg22OdPS
	iJN5wJ7QCtehhzMBxK1W5nI=
X-Google-Smtp-Source: ABdhPJz/79YJoW4tM/jC6kXMlcNE8hSwAEJfMXtgXM8C8A8fZOUBSPLF6AIdQLxKeyZZsP/GTFybDg==
X-Received: by 2002:a05:6214:250e:b0:462:726f:7ebe with SMTP id gf14-20020a056214250e00b00462726f7ebemr25183710qvb.22.1654078219201;
        Wed, 01 Jun 2022 03:10:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:622a:1649:b0:301:e2d6:6a6e with SMTP id
 y9-20020a05622a164900b00301e2d66a6els1463533qtj.4.gmail; Wed, 01 Jun 2022
 03:10:18 -0700 (PDT)
X-Received: by 2002:ac8:5f85:0:b0:2f3:c5c8:8cb0 with SMTP id j5-20020ac85f85000000b002f3c5c88cb0mr51709020qta.408.1654078218468;
        Wed, 01 Jun 2022 03:10:18 -0700 (PDT)
Date: Wed, 1 Jun 2022 03:10:17 -0700 (PDT)
From: "vsun...@gmail.com" <vsuneja63@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <9bc29057-8add-495c-9b35-e94f66183575n@googlegroups.com>
In-Reply-To: <f7188ad3-72bc-0c21-3373-9f1e4728d27a@siemens.com>
References: <fd90fac9-bb12-4839-b659-c417b236e04an@googlegroups.com>
 <f7188ad3-72bc-0c21-3373-9f1e4728d27a@siemens.com>
Subject: Re: imx8: could load 2nd linux in console but not getting how to
 get the shell up in display screen
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3704_1042728449.1654078217951"
X-Original-Sender: vsuneja63@gmail.com
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

------=_Part_3704_1042728449.1654078217951
Content-Type: multipart/alternative; 
	boundary="----=_Part_3705_1645126332.1654078217951"

------=_Part_3705_1645126332.1654078217951
Content-Type: text/plain; charset="UTF-8"

Hi,

Sorry for the delay in response!

I am trying for two cells writing into real display. Recently i updated 
kernel to 5.4.147 & after that 2nd image not booting up on non-root cell. 
Raised a query related to that also. With the previous kernel i could boot 
up 2nd emmc image on console. End goal is to have display sharing for both 
images or separate display. Any input from your end on that?

On Wednesday, April 27, 2022 at 11:57:57 AM UTC+5:30 j.kiszka...@gmail.com 
wrote:

> On 26.04.22 19:25, vsun...@gmail.com wrote:
> > Hi,
> > 
> > I could load custom image in emmc & that boot up successfully via
> > jailhouse non-root cell in console. Root cell image shell getting
> > displayed on hdmi but not getting how to display 2nd linux shell on
> > imx8mq. How to achieve this or any other way for display?  
>
> Do you just need a shell? Via a UART or via network/ssh? Or do you need
> two cells writing onto real displays?
>
> Jan
>
> -- 
> Siemens AG, Technology
> Competence Center Embedded Linux
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9bc29057-8add-495c-9b35-e94f66183575n%40googlegroups.com.

------=_Part_3705_1645126332.1654078217951
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<div><br></div><div>Sorry for the delay in response!</div><div><br></div=
><div>I am trying for two cells writing into real display. Recently i updat=
ed kernel to 5.4.147 &amp; after that 2nd image not booting up on non-root =
cell. Raised a query related to that also. With the previous kernel i could=
 boot up 2nd emmc image on console. End goal is to have display sharing for=
 both images or separate display. Any input from your end on that?</div><di=
v><br></div><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_att=
r">On Wednesday, April 27, 2022 at 11:57:57 AM UTC+5:30 j.kiszka...@gmail.c=
om wrote:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 =
0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">On =
26.04.22 19:25, <a href data-email-masked rel=3D"nofollow">vsun...@gmail.co=
m</a> wrote:
<br>&gt; Hi,
<br>&gt;=20
<br>&gt; I could load custom image in emmc &amp; that boot up successfully =
via
<br>&gt; jailhouse non-root cell in console. Root cell image shell getting
<br>&gt; displayed on hdmi but not getting how to display 2nd linux shell o=
n
<br>&gt; imx8mq. How to achieve this or any other way for display? =C2=A0
<br>
<br>Do you just need a shell? Via a UART or via network/ssh? Or do you need
<br>two cells writing onto real displays?
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, Technology
<br>Competence Center Embedded Linux
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/9bc29057-8add-495c-9b35-e94f66183575n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/9bc29057-8add-495c-9b35-e94f66183575n%40googlegroups.co=
m</a>.<br />

------=_Part_3705_1645126332.1654078217951--

------=_Part_3704_1042728449.1654078217951--
