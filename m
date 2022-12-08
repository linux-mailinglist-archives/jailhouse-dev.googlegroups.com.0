Return-Path: <jailhouse-dev+bncBCDKHIWT5EIBB4UZZCOAMGQEPVT5JJY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113f.google.com (mail-yw1-x113f.google.com [IPv6:2607:f8b0:4864:20::113f])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E62E6473F4
	for <lists+jailhouse-dev@lfdr.de>; Thu,  8 Dec 2022 17:12:36 +0100 (CET)
Received: by mail-yw1-x113f.google.com with SMTP id 00721157ae682-3b102317668sf18618227b3.23
        for <lists+jailhouse-dev@lfdr.de>; Thu, 08 Dec 2022 08:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hxLVtFDRBSem4Q7YKOC2dW8y/xct99fuQsm6R0KLvc=;
        b=HMchc/8ojITrhWL+21bLJ148iTro/Zx7BteKSTiXKhYqZ0xvYJV9DMW+R8ATaRGTJd
         rhFm/B4JRn82k4IdcgmkX8yAnPJtNBcG4xaIO0UmGyca5LWin/8Mqqkflpa40sK5zQGW
         h4QSsoXkfmO2J1ufO5KqI6OXgbbKoRn79PICs23OGL3lN4pJ302y6GRlm+mIGj+mqPLA
         1tr9Y001586hTJBk7bInAs/L0grRh3D7ACaoZxy2SUXowQV98r+58E2hxcHyjDsIPimI
         XMgOH5XF6vzQWbRq8bEHvvylBAR4OCFSvSLnOG6jn7FjF+Pko4jSVrjOwoukMGpwMKnN
         Ioiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7hxLVtFDRBSem4Q7YKOC2dW8y/xct99fuQsm6R0KLvc=;
        b=Qn7y3AGWHHF8VmGDpYNigMrhgkxnzwWoGR0eoX3+krqmksItXQL+gIH0LZP19+e1fG
         pyXRWKOcoLy7hPfJqkir5BaN//rbrDPDhPdvEHwfubHbeskyeWgxD3ttIBkGo4kVCORA
         vQXsH43OuFb5K60KTV6FlgqkaabZr+GDuZITWGv4BfRZiIBxI3wcVhoGpfW7c5l1g2v/
         fkAAMxgZ4d3wBpyc0t1IbKMzSgPWUtCHIMpDvbf8hvgY6TMKu3V1axLRreXHkPIaTnVP
         ImD/AY0pUNud7Df8M8BpYjxFaXHWbINBCDMF5MtYppXccdJCwRfxHyZt49N89TUMuvNg
         T/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7hxLVtFDRBSem4Q7YKOC2dW8y/xct99fuQsm6R0KLvc=;
        b=BeT+dhItNAAgprAxOM6KEoFZ9WYHgujPRtYQhB2TmmimVyiMA+NfH0UaStiCPjOaf/
         yxNcAFSJ/grvJ0qohX7VscSqjMeVLJcsT8bJmt1DSsrlGKWPETrLzsQhMHPWiXJIthDp
         T3vKczMnGsNINyA628ABpGLzfLoT6L7RlxdXYk9UyvP1EHk15xvFs7FTgJ6C4BY1SvR+
         KJvJ+AjwgKlk8FCMCXfd9B6UHimtcGNsLIoi/JiBRLehj6MYi5EWG2XCryqsadnYsGOf
         vPBR/0k3cmtPgrzajZ5VFC94cb4UsHymCv1TRYX+0hutNqasLX5ny3+eTWou7Aj2Opzt
         Ycdw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5pm3gv9pXww7Slk3hKYJkHYWqRcemzNYrqpVUJHEV1hm5gVRclxY
	AR/Ltzz6aq98o9KIpk/SPSA=
X-Google-Smtp-Source: AA0mqf7NYAso2CrJwE2xnck845sdKGTqSxBN0tAd1KuWNReAFpnqt/wVE+hGc6FjEKYx4xbJBfx4bw==
X-Received: by 2002:a25:7e47:0:b0:706:65d1:4a20 with SMTP id z68-20020a257e47000000b0070665d14a20mr8390366ybc.24.1670515954831;
        Thu, 08 Dec 2022 08:12:34 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a81:be17:0:b0:3fe:c52c:dd9a with SMTP id i23-20020a81be17000000b003fec52cdd9als2041795ywn.4.-pod-prod-gmail;
 Thu, 08 Dec 2022 08:12:34 -0800 (PST)
X-Received: by 2002:a81:3c7:0:b0:3eb:447b:56cc with SMTP id 190-20020a8103c7000000b003eb447b56ccmr17947073ywd.296.1670515953909;
        Thu, 08 Dec 2022 08:12:33 -0800 (PST)
Date: Thu, 8 Dec 2022 08:12:33 -0800 (PST)
From: =?UTF-8?B?5byg5a626ZOt?= <j.jyaming@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <a92dcae8-653b-41d6-b235-81835a442ecdn@googlegroups.com>
Subject: Help: Is there any tools to evaluate the cost of Jailhouse?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_13130_1737597262.1670515953180"
X-Original-Sender: j.jyaming@gmail.com
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

------=_Part_13130_1737597262.1670515953180
Content-Type: multipart/alternative; 
	boundary="----=_Part_13131_927390157.1670515953181"

------=_Part_13131_927390157.1670515953181
Content-Type: text/plain; charset="UTF-8"

Hi,

I want to evaluate the number of *VM exits* and other information about the 
Jailhouse at runtime. I'm not quite sure if the *perf *tool is available?

Thanks,
Jiaming.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a92dcae8-653b-41d6-b235-81835a442ecdn%40googlegroups.com.

------=_Part_13131_927390157.1670515953181
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<div><br></div><div>I want to evaluate the number of <b>VM exits</b> and=
 other information about the Jailhouse at runtime.&nbsp;I'm not quite sure =
if the <b>perf </b>tool is available?<br></div><div><br></div><div>Thanks,<=
/div><div>Jiaming.</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/a92dcae8-653b-41d6-b235-81835a442ecdn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/a92dcae8-653b-41d6-b235-81835a442ecdn%40googlegroups.co=
m</a>.<br />

------=_Part_13131_927390157.1670515953181--

------=_Part_13130_1737597262.1670515953180--
