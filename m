Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBBEVP4GYAMGQEODIJQVQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3d.google.com (mail-yb1-xb3d.google.com [IPv6:2607:f8b0:4864:20::b3d])
	by mail.lfdr.de (Postfix) with ESMTPS id B293B8A20F6
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Apr 2024 23:35:16 +0200 (CEST)
Received: by mail-yb1-xb3d.google.com with SMTP id 3f1490d57ef6-dcdc3db67f0sf1802082276.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Apr 2024 14:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712871315; x=1713476115; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aYmw4/4mi+NuhBxo9QZgjVJW0/mgtoRk4SvDAa/jkSw=;
        b=R35daLZ4ZjjNQ6SaqPqUkWi95gZ1AKp23pyvM7YgW8dChNCk++XUwOuLBbEn+ESw53
         UmYOhphLiNmnzlo7VxTX2wOaVc/uKeUNfMkt74f2cTP1Jx0b8w6vbz+K6Xcs5bCSrIT3
         3JuBUjYo+MwdxLMWUVDJxPKAR0jVxDMW26Wm4+tTYTJ2Zn7qSlybXkABv6WL019YQhf4
         rNtsBKoeJeg+FckJKrfnK5NJERaf5lCz/if4CXYWa8txfjQSdY6TrjGHrM214bs7F0+o
         GL5f2aIFL6pLuJSZMDM/pBB23W2glv6FtKLutX6oLVbPTKok/h61ur//RQk33h/oShQr
         6F/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712871315; x=1713476115; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aYmw4/4mi+NuhBxo9QZgjVJW0/mgtoRk4SvDAa/jkSw=;
        b=EKKPJEDBOu3oGBqH8ftyk8DTMvraeEgu0pRONtivmZSYN2LHpSDbQr9ccOymBtXeXj
         7/bPIDjtvoHt12lIJrKhopKY297nrWqh/S5eWs1ZZvEEMhQgpAIzG12kEUxg7X63hI9E
         XPQRPWx7kWE2PFUEk8h/tTxr8HgC6JIPH/vC3tx2wIH0xc7jrNC7gx1ycaknd3iltoAz
         ejTGPSpUBS4AsQf/E3R3Ks6Is0o4fsShHFyDbRVtQZDRfVrIt8DDZtK0ZjWRxHqdNx4p
         B2vQ+NcxI30jERfUS8Nd3qjEa314afyQaJ+j3WVSieBYVXszTXqccY6d7IieEn9MC9Dp
         PdtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712871315; x=1713476115;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aYmw4/4mi+NuhBxo9QZgjVJW0/mgtoRk4SvDAa/jkSw=;
        b=T849JXSgrd80SJ2sBNl5erE0xMphhdahtxbXNj7PJnTVm39NsQHbTP1ozOFxFXz18V
         Uu8Yng4wIPczvBmUy1LSJJoRWwCG9qdbkUTHnt1EA0mes7wyyCVntm9wXrsrcOVncpC5
         msVtadkBRbSB8yzPZ43tPNPiZE+4KMzlxNyVru+HS+sXzGYHWtAjafrEljr1YuTdfU6Q
         o/Ulc1kHu+YNfCtL1oG4Hl5TZuVJMzbcOX8RtVWFvIXwOW54I6flODdbUrU+pEg4eAQq
         OCFERVo6uxIp3qVdrsZWDottA68J6a/UYrKYNRU5mWf/HTYwToCAIeWaE/Li5W7V4Fd1
         r+8w==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCVGBPv6QICJQTDTLb7xqlHClfps/sBBvPjlM16XflfzzZH2nq8rHlBZVZLQCGKE9dbG7dfeyNKzsZZxKRZgD7TGgxMlNdTPcp/E14A=
X-Gm-Message-State: AOJu0Yz7KYoCpAUFgouCp7UO2s+Gdw7V2R+3l4I1qSiBPcCxZ92gTXzw
	o8KXm9IgHrsGLOgLkFPyRDUlzZfzeToa8WVR/4ZN1tZJyLCvxhCQ
X-Google-Smtp-Source: AGHT+IFW7fCHsoWoju6S14HgrXr+1bfsoDCi4/9U8ZYP+X4UG1cIptau5dMsbE3w0I8O4v09JBTkRg==
X-Received: by 2002:a25:1143:0:b0:ddd:7ade:bd45 with SMTP id 64-20020a251143000000b00ddd7adebd45mr2671285ybr.30.1712871315475;
        Thu, 11 Apr 2024 14:35:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:74c3:0:b0:dcc:717f:41b7 with SMTP id p186-20020a2574c3000000b00dcc717f41b7ls617190ybc.0.-pod-prod-07-us;
 Thu, 11 Apr 2024 14:35:14 -0700 (PDT)
X-Received: by 2002:a0d:eacb:0:b0:615:2b57:35ea with SMTP id t194-20020a0deacb000000b006152b5735eamr173305ywe.2.1712871313642;
        Thu, 11 Apr 2024 14:35:13 -0700 (PDT)
Date: Thu, 11 Apr 2024 14:35:12 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <097b5cb5-9a1b-44b7-b9d8-9a947007f4d4n@googlegroups.com>
In-Reply-To: <e22563ea-abb2-4d80-b988-6bed42ab51a9@oth-regensburg.de>
References: <824bacc4-b7ae-47c9-878e-7203214b4fc3n@googlegroups.com>
 <0431cb6c-c2ca-4417-97d4-f0dc9bc3f389@oth-regensburg.de>
 <9a021e3f-caca-4ebe-9351-be2c3e999446n@googlegroups.com>
 <e4aef5c1-45fa-49f2-8b6c-04f36d7f556d@oth-regensburg.de>
 <23a9c30e-5507-449e-9589-697904becac4n@googlegroups.com>
 <81df336d-a7bb-49e2-8762-a1294aef67e9@oth-regensburg.de>
 <bbd32aa2-053e-40a2-b4d5-2326238d0793n@googlegroups.com>
 <0aa4c10d-a635-4a37-bf51-2b9863beb2a0@oth-regensburg.de>
 <6712361a-eaef-49cc-8a72-79da2c434169n@googlegroups.com>
 <b4520b71-86ba-48e7-b9ad-c720c4f6cb42@oth-regensburg.de>
 <860c1e75-c28f-4157-9212-a3d87ad25b27n@googlegroups.com>
 <b13f671c-b870-48b1-8f39-d5eae43c7a5b@oth-regensburg.de>
 <6146e208-1e8c-4335-abaf-9a2be8c85be5n@googlegroups.com>
 <78750023-1199-41e6-bee9-549c185d160c@oth-regensburg.de>
 <6fb04e63-2f4a-4d5b-9139-c11e9a9fc461n@googlegroups.com>
 <5fc9ef1f-e7ca-496f-aab5-c085c4586326@oth-regensburg.de>
 <0f1154fe-f680-47e6-a3da-9e1a37fd1f55n@googlegroups.com>
 <e22563ea-abb2-4d80-b988-6bed42ab51a9@oth-regensburg.de>
Subject: Re: Unable to start non root linux cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_118866_1150591066.1712871312946"
X-Original-Sender: massimilianodimajo097@gmail.com
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

------=_Part_118866_1150591066.1712871312946
Content-Type: multipart/alternative; 
	boundary="----=_Part_118867_1114777678.1712871312946"

------=_Part_118867_1114777678.1712871312946
Content-Type: text/plain; charset="UTF-8"

MT103/202 DIRECT WIRE TRANSFER
PAYPAL TRANSFER
CASHAPP TRANSFER
ZELLE TRANSFER
LOAN DEAL
TRANSFER WISE
WESTERN UNION TRANSFER
BITCOIN FLASHING
BANK ACCOUNT LOADING/FLASHING
IBAN TO IBAN TRANSFER
MONEYGRAM TRANSFER
IPIP/DTC
SLBC PROVIDER
CREDIT CARD TOP UP
DUMPS/ PINS
SEPA TRANSFER
WIRE TRANSFER
BITCOIN TOP UP
GLOBALPAY INC US
SKRILL USA
UNIONPAY RECEIVER

Thanks.


NOTE; ONLY SERIOUS / RELIABLE RECEIVERS CAN CONTACT.

DM ME ON WHATSAPP
+44 7529 555638

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/097b5cb5-9a1b-44b7-b9d8-9a947007f4d4n%40googlegroups.com.

------=_Part_118867_1114777678.1712871312946
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

MT103/202 DIRECT WIRE TRANSFER<br />PAYPAL TRANSFER<br />CASHAPP TRANSFER<b=
r />ZELLE TRANSFER<br />LOAN DEAL<br />TRANSFER WISE<br />WESTERN UNION TRA=
NSFER<br />BITCOIN FLASHING<br />BANK ACCOUNT LOADING/FLASHING<br />IBAN TO=
 IBAN TRANSFER<br />MONEYGRAM TRANSFER<br />IPIP/DTC<br />SLBC PROVIDER<br =
/>CREDIT CARD TOP UP<br />DUMPS/ PINS<br />SEPA TRANSFER<br />WIRE TRANSFER=
<br />BITCOIN TOP UP<br />GLOBALPAY INC US<br />SKRILL USA<br />UNIONPAY RE=
CEIVER<br /><br />Thanks.<br /><br /><br />NOTE; ONLY SERIOUS / RELIABLE RE=
CEIVERS CAN CONTACT.<br /><br />DM ME ON WHATSAPP<br />+44 7529 555638<br /=
><br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/097b5cb5-9a1b-44b7-b9d8-9a947007f4d4n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/097b5cb5-9a1b-44b7-b9d8-9a947007f4d4n%40googlegroups.co=
m</a>.<br />

------=_Part_118867_1114777678.1712871312946--

------=_Part_118866_1150591066.1712871312946--
