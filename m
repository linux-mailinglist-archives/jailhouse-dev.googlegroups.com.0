Return-Path: <jailhouse-dev+bncBAABBP6XRWLAMGQE354W3JA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x13f.google.com (mail-il1-x13f.google.com [IPv6:2607:f8b0:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D10E565F6E
	for <lists+jailhouse-dev@lfdr.de>; Tue,  5 Jul 2022 00:37:53 +0200 (CEST)
Received: by mail-il1-x13f.google.com with SMTP id n13-20020a056e021bad00b002dc0580da61sf2502649ili.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 Jul 2022 15:37:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656974272; cv=pass;
        d=google.com; s=arc-20160816;
        b=ocLAnJg0xGTIUi2vySrumX5A1ueWkWTsH7u8IvuPAajKrh1KHCxPJ94RamPF2k+Hoh
         j99BKNB5T9KTHLT2S5Kd4y7tHMKSs0wCh/6JK6DSONsyVfp5gm07bgbzddXotfbWxp9D
         /KpTRts9C5bFbY5Lf0bKDrg/TtxZwTMg3jp/+j5m+ZTRfMDBKtg8azJqt8dsyZMAUOR+
         EdtwGy/6fvhCDxFu1qBXwJ6cy9QCr4eVmwKUg/gQ/5sgwnZgRjCKpKPaHHccbhmO1z8v
         tSSfEybiZLrR4fgY6xDp15sRbUiTqN8rfUq8L88Xe2HI9eqQWPR+oN57PRdHw8FlbnAo
         rsmA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:reply-to
         :subject:to:from:date:user-agent:sender:dkim-signature;
        bh=djpIrEb2PKR3KHvvX8pkT9HodjMcFrqFb/XuIxie+0I=;
        b=jhHym2KQo9kJpozHm8fv/PmUcuWmjT1KHtYKLXy3EhM4A1Iiun0WFz9h1X7HtgNuvi
         MKcVZNUuGVnJpm4w22FeQ5HzuvKF8xGGXZ8W/ok3hiRituOMCmWGUtfx5092F8acQi1d
         AWiQrXJyxc6/C2VmXGgX/+0v64fbVn6JyGDV+jXaoJdwM36DoWjPj5dhodtQcTNlWcB4
         VaSgD0L8Z9Jb5ABtNYSSz8h7Iu4AcLVN2klwJ/WjPsHRqyarTVIUK1ahyTbX5bB/MbgL
         cHopboi/Tt+jfUwO7nYYkkntQa2bk/RWg6N4eItHOGjNfEJTgjLzdVT23H9TQ5y89BWV
         T/HA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@qiji.com.sg header.s=default header.b=MgCNhoF3;
       spf=pass (google.com: domain of no-reply@qiji.com.sg designates 103.15.234.209 as permitted sender) smtp.mailfrom=no-reply@qiji.com.sg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:user-agent:date:from:to:subject:reply-to:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=djpIrEb2PKR3KHvvX8pkT9HodjMcFrqFb/XuIxie+0I=;
        b=Tv/IYcShOaXIJSvrk3XICXMJhQZfJpxVlRNnCwbWtgy68HLCwdElwTD1hjNfsgzHN+
         5FA4obHp44j7GBN3r/wvsf1UcCubBHdEASoXi5ywsJ+X+7uYtfScScGMNKXESdeITkoE
         Gz/s3oCI/c1a1wlKLkkPbcsdBV3f5n4OtUEd/Y9/aipiagoVEy0iipV0fcGpw6UHYfOv
         yhXpES1xIEMHSTXJ7sKAsUkAhJt+T7c+9lQbsWnK/cc6qKlE6A+Q5xwnS/3MnqkjchfK
         +xMocflrGmK1z0py6wU/kpEgmncgUZqdsUOV6Rtgo5mCoqAXSc4NrnFR5Tr+m3IGSKQq
         X9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:user-agent:date:from:to:subject:reply-to
         :message-id:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=djpIrEb2PKR3KHvvX8pkT9HodjMcFrqFb/XuIxie+0I=;
        b=09zbJnN976EdJ3RLEArpZSGj+XhCmozku2Amr4HMOvlhsJZapaNlfv5GBdRCTSoN3g
         XMEIKVZGoq9A7lmn32O3NusM/yHCeKsIZK6VTryKhEgk5+K/aO8MqLLlEJQ7MnQcVWae
         6O9jZbUr2Y19U+4P+KBBrvigbhFqgfd+9INe+eewB1VXe9INBORidLf/h2r5HLNhoOKH
         V6G9Yn9+xqDV+ujXV8KC4mQGJGZhewx6xi8iOIE4/WdWiyfmI5Lj16IXHVIPZ2QRAfZQ
         YnpLOHzbp4N/lRyp4FLmhYvq4prtfk/X91ZWBRAm2e7A/mvsL7sZBOsv540KVWDHljKu
         fiGg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora8Tucbrp7E1QNuBdlFeCZatG+oz/Xsy1QkPnPy64CWGQJ9sva+L
	mhPpC0pGYZQcLSnN8I1zgBY=
X-Google-Smtp-Source: AGRyM1tDpLTz2LWlUiyQOOKnF1Sg66V4dWegsBTiCHtNXOtTMtzCbQ39Br+p1YHpTbjLQP3S4EBo7Q==
X-Received: by 2002:a05:6638:1506:b0:33e:ba5d:b2c4 with SMTP id b6-20020a056638150600b0033eba5db2c4mr8633777jat.279.1656974272049;
        Mon, 04 Jul 2022 15:37:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a6b:8e0c:0:b0:675:970a:3958 with SMTP id q12-20020a6b8e0c000000b00675970a3958ls1172013iod.2.gmail;
 Mon, 04 Jul 2022 15:37:50 -0700 (PDT)
X-Received: by 2002:a6b:fd13:0:b0:675:3114:23a0 with SMTP id c19-20020a6bfd13000000b00675311423a0mr17100835ioi.54.1656974270036;
        Mon, 04 Jul 2022 15:37:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656974270; cv=none;
        d=google.com; s=arc-20160816;
        b=SZPRvwUpAJqJ9LbTs1ENa2u8xis2WoWODDZ0+V01xdVYVkokinsK41R92zySTUeH2G
         Ln5u9oLpFd9lVWYxHFw8P7ZUNAKAJSZu+f35KO7gqZWTFcPo51FmFWlzNbKWmcuLOe1y
         B/d0RQfUlrHxVhXr+q0hgKP6/L5bjdMVUrY7jfUiKvkdzlSLoT6G0gpCeWqRkfPsRDuB
         WCB1+BQOY9+yzg2T341/iP4knzFK31me0QkvGltZIzHJTDxOgxH+uwQCGHklRlgcLud+
         A2G/k00a7aAULOE9T4bIkXl4C0ptxBugeMINm1YOcmWLqdX4dYmqH0QNA3hjPCAgUOwM
         voyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:reply-to:subject:to:from:date:user-agent
         :dkim-signature;
        bh=YbWxouVbcVzeqAcyVxED5AqFxsALPfAdylCvUqWK9Lo=;
        b=UNwZg1Wwyopi+pnEJMGfvE65Pw5N5hVZCxvdiNlwJAv7l0Bcj4qIa78x0nvw4E9m1d
         cQ7f+ArEbCyl7ePIxxvNNZevWOEPn+SqdWdnRNFURzmstx7Il65baOgDJyywHw9T5Zq+
         0JD5seLtdvM3ZRzLeEL9r183wKVDnejyoGYkPkxElVOeBfJ9fgNkIiYgiLHbmRYXMQPh
         2kDMQNt57+OgK5+2ZPAov9awWoJhbyzrMfHQm9odpGn1FGGHIL7JNcRyD8Irwi/vGAr0
         Igunm3CwGrWKcOs/qphgmR48riP7JLkaVrAuUL4G60mSha5rgrZTWz4jBBpD7mL0O4eX
         AUjA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@qiji.com.sg header.s=default header.b=MgCNhoF3;
       spf=pass (google.com: domain of no-reply@qiji.com.sg designates 103.15.234.209 as permitted sender) smtp.mailfrom=no-reply@qiji.com.sg
Received: from v234209.serveradd.com (v234209.serveradd.com. [103.15.234.209])
        by gmr-mx.google.com with ESMTPS id a6-20020a92d106000000b002d77420723csi977630ilb.3.2022.07.04.15.37.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Jul 2022 15:37:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of no-reply@qiji.com.sg designates 103.15.234.209 as permitted sender) client-ip=103.15.234.209;
Received: from v234209.serveradd.com ([103.15.234.209]:54056 helo=www.qiji.com.sg)
	by v234209.serveradd.com with esmtpa (Exim 4.95)
	(envelope-from <no-reply@qiji.com.sg>)
	id 1o8UhO-0004am-SZ
	for jailhouse-dev@googlegroups.com;
	Tue, 05 Jul 2022 06:37:46 +0800
User-Agent: CodeIgniter
Date: Tue, 5 Jul 2022 06:37:46 +0800
From: "Qi Ji" <no-reply@qiji.com.sg>
To: jailhouse-dev@googlegroups.com
Subject: =?utf-8?Q?Qi_Ji_Online_Order:_New_Sign_Up_Verification?=
Reply-To: "no-reply@qiji.com.sg" <no-reply@qiji.com.sg>
X-Sender: no-reply@qiji.com.sg
X-Mailer: CodeIgniter
X-Priority: 3 (Normal)
Message-ID: <62c36bbaa40c6@qiji.com.sg>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="B_ALT_62c36bbaa4106"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - v234209.serveradd.com
X-AntiAbuse: Original Domain - googlegroups.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - qiji.com.sg
X-Get-Message-Sender-Via: v234209.serveradd.com: authenticated_id: no-reply@qiji.com.sg
X-Authenticated-Sender: v234209.serveradd.com: no-reply@qiji.com.sg
X-Original-Sender: no-reply@qiji.com.sg
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@qiji.com.sg header.s=default header.b=MgCNhoF3;       spf=pass
 (google.com: domain of no-reply@qiji.com.sg designates 103.15.234.209 as
 permitted sender) smtp.mailfrom=no-reply@qiji.com.sg
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

This is a multi-part message in MIME format.
Your email application may not support this format.

--B_ALT_62c36bbaa4106
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear rsrqbx =E2=9D=A4=EF=B8=8F Have you ever tried this sex game before? GI=
VE IT A TRY:
https://letsg0dancing.page.link/go?uwovu =E2=9D=A4=EF=B8=8F

Thank you for signing up with us. Here are just some of the benefits
you&#39;ll enjoy as a registered user:&nbsp;

Fuss-free order and checkout experience
Access to your purchase history
Retrieve your payment receipt

Please click on the link below to verify your email address
jailhouse-dev@googlegroups.com and start ordering -&nbsp;

http://www.qiji.com.sg/customers/verify/62c36bba9ad46

&nbsp;

KA Food Link
171 Kampong Ampat #04-11
Singapore 368330
Tel : (65) 6283 8572
Fax : (65) 6283 8573

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/62c36bbaa40c6%40qiji.com.sg.

--B_ALT_62c36bbaa4106
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p>Dear rsrqbx =E2=9D=A4=EF=B8=8F Have you ever tried this sex game before?=
 GIVE IT A TRY: https://letsg0dancing.page.link/go?uwovu =E2=9D=A4=EF=B8=8F=
</p>

<p>Thank you for signing up with us. Here are just some of the benefits you=
&#39;ll enjoy as a registered user:&nbsp;</p>

<ol>
	<li>Fuss-free order and checkout experience</li>
	<li>Access to your purchase history</li>
	<li>Retrieve your payment receipt</li>
</ol>

<p>Please click on the link below to verify your email address jailhouse-de=
v@googlegroups.com and start ordering -&nbsp;</p>

<p><a href=3D"http://www.qiji.com.sg/customers/verify/62c36bba9ad46">http:/=
/www.qiji.com.sg/customers/verify/62c36bba9ad46</a></p>

<p>&nbsp;</p>

<p><img alt=3D"" src=3D"https://www.qiji.com.sg/assets/upload/images/QJ%20L=
ogo_QJ%20Green%20Orange.png" style=3D"width: 119px; height: 84px;" /><br />
KA Food Link<br />
171 Kampong Ampat #04-11<br />
Singapore 368330<br />
Tel : (65) 6283 8572<br />
Fax : (65) 6283 8573</p>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/62c36bbaa40c6%40qiji.com.sg?utm_medium=3Demail&utm=
_source=3Dfooter">https://groups.google.com/d/msgid/jailhouse-dev/62c36bbaa=
40c6%40qiji.com.sg</a>.<br />

--B_ALT_62c36bbaa4106--
