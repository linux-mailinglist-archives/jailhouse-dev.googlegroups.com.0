Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBB47H4GYAMGQE3EYOMNY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb40.google.com (mail-yb1-xb40.google.com [IPv6:2607:f8b0:4864:20::b40])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED218A225B
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Apr 2024 01:36:21 +0200 (CEST)
Received: by mail-yb1-xb40.google.com with SMTP id 3f1490d57ef6-dc6b269686asf529964276.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Apr 2024 16:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712878580; x=1713483380; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5Ty0tTM6eHWQ30uvv11HsGUSfccLSjuMx/1b+Y+JRzg=;
        b=Zi2sgpMISLE9ukO9PF8yXRRezAl1buzia0rgZ5w9XGdLLCfu35G77GBPRRgM/va+8S
         UvXDRzx3zdoWJyKiXh8bo/wycmTn53H5LFsoIFpgElLX1rBm/p8fO1ezl6dqIAJ3zwO7
         itSoaz3YIya8zlAQhh5D9PCCHNYYJVVIB17EAEs5GRpMhqdOCTi8kcNSESn0NZYnFHun
         9P12U+PWP63ZJxHB1xObfAUSEPSrSjUOeXqikz2xTGHpRncFUP97g6p59Nd7ZntRcyE1
         qj9euNjdycEl670Djt+XN+rTD9m/JHelh/RdkKzXbT2OwA57cRkzdULValWf9nZWv7wt
         DPYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712878580; x=1713483380; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Ty0tTM6eHWQ30uvv11HsGUSfccLSjuMx/1b+Y+JRzg=;
        b=MO2mzR8CWuYDO5KhPrd5H73wRJAXkd6oUf0N4WkUblgJsf2mJpafLhPLZ199eJpTTc
         mMaoc+St5haRTqw1k8jnKF+d943v9PwC054Xx5iQRf9PoeeOb1q7Ye9y589DEy/J7QHe
         A/QqnZcj0qSTKEfKTmi1Vz9p7ESqpEMYZGAtK5YHXvgjPsQe3VkLUM2C3X1orAypejRO
         h9pVN/JHUhtRpYk5QOf/LOoFfjJiHO0AI9eLHTz6aXKS3hxhG4c7x0Hu/+rC7xFy5epN
         bE0xYcTbUhp91CntUkDgn3IJrYbFr6iCMtrfN9jA7wwCboLOkjIemiXFBMqVPHSw9IKz
         GVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712878580; x=1713483380;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5Ty0tTM6eHWQ30uvv11HsGUSfccLSjuMx/1b+Y+JRzg=;
        b=xHygTmiRRZusr/eRtHeZld1vZNiX7RLaOMA0lePS4DRJKzAk+6xQvMpjyaKgSvaBZ4
         6TldDvBu9Ye+FWUdJYOb2dEweXf4jY98e8ivLNidThO+zzyTNk4vv/kw7/73S2Flk1mO
         Y2XvHLKngiWcQiLy9alIYSNOamrPW2UVZEEJQd5WjBc+F6Pq2neVF76GBGy7v/uvV5aI
         nh+9AwPBKDHLKi3W4RzN1Y8gpbmDg+JTzUZU11Pw4yT5t6N7RYlIDpycQVuEvKPgvksN
         98P/5Qo4Pg5ge12yibF95SO52yVO2XxbQucrjigITI6QbosoTEUUz1zacWcvHDvhhr+W
         ifRA==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCUXWe7Z8NOtlorGKp4InKH096CrW9OTonlM1jod1lM3mVVpfyNjXkkbPHzvEvW5aIENITUfgkRS5K7g5srZGA9MQUTdFBtv4pGibQY=
X-Gm-Message-State: AOJu0YzShju7PXq+L8gvlnY6yvsvEOHuUAy5WobZT0sWaT2x9clYCM/A
	MNn2OnIVf6qs8OyXt72HsLmgXwEXbIZcEY2xyTMGs/pyDiRB3GXL
X-Google-Smtp-Source: AGHT+IHm8TBSTKPvgj8ziE0ajMRi3xRlf2knU8buhPSGwNW7dDs3IC2eMbDFFaCVf2ozJMcvpoHMoQ==
X-Received: by 2002:a25:bf91:0:b0:dcd:26a8:7f84 with SMTP id l17-20020a25bf91000000b00dcd26a87f84mr950840ybk.47.1712878580429;
        Thu, 11 Apr 2024 16:36:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:74c3:0:b0:dcc:717f:41b7 with SMTP id p186-20020a2574c3000000b00dcc717f41b7ls734400ybc.0.-pod-prod-07-us;
 Thu, 11 Apr 2024 16:36:19 -0700 (PDT)
X-Received: by 2002:a05:6902:348:b0:dc7:5c0d:f177 with SMTP id e8-20020a056902034800b00dc75c0df177mr256363ybs.6.1712878578847;
        Thu, 11 Apr 2024 16:36:18 -0700 (PDT)
Date: Thu, 11 Apr 2024 16:36:18 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <76dfef5b-4347-4a73-9a8a-2fc3e93f6c30n@googlegroups.com>
In-Reply-To: <CAC5TEnH7LLTko45DKC7_4eB_9J-p8+2t1NuKMCUbm42X8p8Mhw@mail.gmail.com>
References: <CAC5TEnH7LLTko45DKC7_4eB_9J-p8+2t1NuKMCUbm42X8p8Mhw@mail.gmail.com>
Subject: Re: Problem when assigning a physical UART to a non-root cell (ARM
 architechture)
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_198424_913298882.1712878578183"
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

------=_Part_198424_913298882.1712878578183
Content-Type: multipart/alternative; 
	boundary="----=_Part_198425_1424359790.1712878578183"

------=_Part_198425_1424359790.1712878578183
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/76dfef5b-4347-4a73-9a8a-2fc3e93f6c30n%40googlegroups.com.

------=_Part_198425_1424359790.1712878578183
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
om/d/msgid/jailhouse-dev/76dfef5b-4347-4a73-9a8a-2fc3e93f6c30n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/76dfef5b-4347-4a73-9a8a-2fc3e93f6c30n%40googlegroups.co=
m</a>.<br />

------=_Part_198425_1424359790.1712878578183--

------=_Part_198424_913298882.1712878578183--
