Return-Path: <jailhouse-dev+bncBCJ7NNNA3ADBBOM35DVQKGQEYZPMYVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x338.google.com (mail-ot1-x338.google.com [IPv6:2607:f8b0:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAEEB0B27
	for <lists+jailhouse-dev@lfdr.de>; Thu, 12 Sep 2019 11:19:55 +0200 (CEST)
Received: by mail-ot1-x338.google.com with SMTP id d20sf14369928otp.17
        for <lists+jailhouse-dev@lfdr.de>; Thu, 12 Sep 2019 02:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7esWKvtxlsG6tvbLYeh39PK+qETP3h+w9ID/ea5ssNY=;
        b=l3Pm8O4ChzFkEWbRrE5yii9VfxKvfSRHXbP559Uv02OAvMPo6KdEXmSBRcspwQoOig
         UjfN1N2L/sx3flbUCc9r0UOFyPu9/qRZB0AziG/0CtO9TwMRR4DJ+WwLDyht6Q6g1bzU
         /4eu48oewrTMuW4TxYmtpSRHdY73t5WtfhBPJmVCo7OON2XoMPLoIE1LAPhfPjLhTetR
         uNKALhqNRNMLJTRVGnr/GS6Vcqg6EM7x+oCCbIN8NsxXbOnB4zKfKz9YL1EGvITsYqUS
         05WkbXUT0NTXmIxUigH0esmuK6d233y5e8LukVlvM6S33u3e/gMZVBsTVehlpA6RGycV
         XHAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7esWKvtxlsG6tvbLYeh39PK+qETP3h+w9ID/ea5ssNY=;
        b=AH+Fe3/IyfFtUonOHj/rtZgGg8venvnSt2LeszssNwkiaSpLk04/Ha/3qEGpvN6NjH
         Vkf1EEjujo59BXg/RYeqDz5zAiVaDNAwDdNjLfZ7IF5dlwRXyLElt1orkulajZj0tzBI
         dWWx4PGoG8DqiEXmnnRTwliZdiZYUrcijHL1GASeCYqR7RnSQfJLbFy5pmlqhyOcd8l0
         /BDWGINFqIENxpEe8derukvfQJ9x0eGW92crIfsXehO8ns6vAKttYhHYCc5bJf4XWymR
         3o2wz9Jy6jGTWt/eh73SPEPi45u4KT9KnsphbfBC+YeLJvEezdvMZSNHbsz5ffOFQCqt
         M21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7esWKvtxlsG6tvbLYeh39PK+qETP3h+w9ID/ea5ssNY=;
        b=XsVjP5bHqWshns0MDaxUm+UlaKw6pqloPxcD9ZuidvZloeJmz9vK3j+EQrhqr76QR+
         WlwS0P0fYSERgVGDgZT4kQrHfEDj6bKwI7i4xwx25R+X3kn9UYz1rbL9n3XbxqglMy34
         jMseGqUMS1y53kLMVOzwv73+nO9/c7xnlxK0y6BkA034LlfRSqFPAX52dTfFxhn82709
         kDK7rWjoxvrp10sU50ABlyVUL4TObdhAKoiqsFpBqzuYkdsky9yKAD1bqesLc9R587T/
         F5MAFTXTPFZ8RVcCLil5vM3lfe7H82H2b8f8cADRKpyYS/H5l0kcm/6SuoLk11gGgLgF
         fQoQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUuiX3v5UP5cccUkkqO3D5fykexOLVaQT+CEDvu3KlW7oIqSHrF
	rH/TEGk27hh1IHaCCsO7rfY=
X-Google-Smtp-Source: APXvYqz59x5YO2iP7U6xQCDPfgyeauuL7AKo1j0c7F+g4eWceWqYMwKhgUMb0tB3vgLG1WMtbjip6g==
X-Received: by 2002:aca:4b85:: with SMTP id y127mr7754113oia.70.1568279993610;
        Thu, 12 Sep 2019 02:19:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:1a12:: with SMTP id a18ls2219782oia.14.gmail; Thu, 12
 Sep 2019 02:19:53 -0700 (PDT)
X-Received: by 2002:a54:4703:: with SMTP id k3mr7340713oik.143.1568279992771;
        Thu, 12 Sep 2019 02:19:52 -0700 (PDT)
Date: Thu, 12 Sep 2019 02:19:52 -0700 (PDT)
From: Peter Smith <salerio@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <50509467-1cc3-4532-be45-5fbb44138efb@googlegroups.com>
Subject: GIC demo on ZCU102 using Xilinx 2019.1
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1365_719789630.1568279992290"
X-Original-Sender: salerio@gmail.com
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

------=_Part_1365_719789630.1568279992290
Content-Type: multipart/alternative; 
	boundary="----=_Part_1366_2088054771.1568279992290"

------=_Part_1366_2088054771.1568279992290
Content-Type: text/plain; charset="UTF-8"

Hi,

Being a first time jailhouse person I just wanted to ask if the error shown 
below (see affinity error) is expected or is indicating some form of 
problem / bug,

jailhouse cell create zynqmp-zcu102-gic-demo.cell
[  234.513438] IRQ56: set affinity failed(-22).
[  234.513546] CPU3: shutdown
[  234.520525] psci: CPU3 killed.
Created cell "gic-demo"

The environment was created using Xilinx's 2019.1 meta-xilinx-bsp layer 
(4.19 kernel) and the contents of the master branch of jailhouse from 
Github.

The gic demo works fine but I did need to keep the second UART awake (cat > 
/dev/ttoPS1 &) to see the output.

Peter


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/50509467-1cc3-4532-be45-5fbb44138efb%40googlegroups.com.

------=_Part_1366_2088054771.1568279992290
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Being a first time jailhouse person=
 I just wanted to ask if the error shown below (see affinity error) is expe=
cted or is indicating some form of problem / bug,</div><div><br><div><div>j=
ailhouse cell create zynqmp-zcu102-gic-demo.cell</div><div>[=C2=A0 234.5134=
38] IRQ56: set affinity failed(-22).</div><div>[=C2=A0 234.513546] CPU3: sh=
utdown</div><div>[=C2=A0 234.520525] psci: CPU3 killed.</div><div>Created c=
ell &quot;gic-demo&quot;</div></div><div><br></div><div>The environment was=
 created using Xilinx&#39;s 2019.1 meta-xilinx-bsp layer (4.19 kernel) and =
the contents of the master branch of jailhouse from Github.</div><div><br><=
/div><div>The gic demo works fine but I did need to keep the second UART aw=
ake (cat &gt; /dev/ttoPS1 &amp;) to see the output.</div><div><br></div><di=
v>Peter</div><div><br></div><div><br></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/50509467-1cc3-4532-be45-5fbb44138efb%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/50509467-1cc3-4532-be45-5fbb44138efb%40googlegroups.com<=
/a>.<br />

------=_Part_1366_2088054771.1568279992290--

------=_Part_1365_719789630.1568279992290--
