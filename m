Return-Path: <jailhouse-dev+bncBCMZLOEWZYNBBNNNXCZAMGQEA3EOPLQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113c.google.com (mail-yw1-x113c.google.com [IPv6:2607:f8b0:4864:20::113c])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3208CC498
	for <lists+jailhouse-dev@lfdr.de>; Wed, 22 May 2024 18:00:56 +0200 (CEST)
Received: by mail-yw1-x113c.google.com with SMTP id 00721157ae682-61be1fcf9absf205541927b3.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 May 2024 09:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1716393655; x=1716998455; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNrQtpfwWuGItNuqlH5K9JReIUj44vQeoLKkLyMnhvk=;
        b=JMIw9/0g3bYT1qdx8+xtthzITmyTyXFEL/7Yz86aMf8DEtxoTHacNsOeYOYDjv8MM4
         M9HZsEBvVG1iDw6ZnEM8QPj1LQGjh7lmj2TCOWxFZKQ2vy6XCzMTGlz3RLRJ/mjehHJU
         ItP/O5mGgYrtd8uyIEezVOUFy2n35yXO/5WfmVeC8ljzERxyBNhXvN9cIu6TsrzvlPlr
         Xl7Fv1vmCNEMvgbK2llYfjuH6tVpjKMuiMED6wV+v9cnL8dtraJTuW51MHWC8Y22Dbv6
         WTLyAExFLINU0roKWEoaezttARc39wDMfhJWGchHr3hZB8036dmeoTOwpNAlItOUXoZf
         OLwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716393655; x=1716998455; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KNrQtpfwWuGItNuqlH5K9JReIUj44vQeoLKkLyMnhvk=;
        b=DHTy3jmDumzudkNCtUeazABDKa/KDwczkrteQ6mVP6/Cq5yg4/c3arHrqbNFZ7ifmE
         UYZG4NsimiypdpTWzNLLbQYIH2bVt2oSP0Uanjz5nTaEuTa2rOuUAqEgnmXOngJ3AIaf
         9C9kLZgrhUUm1hdP5fILfFjI1d/RcGzg7Ov3lGolDx1Msi+KWAkJnTOJCoiWMD5asyaV
         lBHJFsO7dVbtNguCb1QQEu8fai4HdkTMhzVTFI8iOX5LVYqdQwqAn+ggDzSBtVboylMT
         MIJND4hC09M+0LysvRTasRBPPwoD/6Cb7LvH80IF16yQ4hNoLQoe+ILdukCtRfUxkWR0
         ZsuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716393655; x=1716998455;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNrQtpfwWuGItNuqlH5K9JReIUj44vQeoLKkLyMnhvk=;
        b=ujpEvGryTJ8ZOkgloUFFwwhSGxZAw4IbUt3OjRd733I2wLXW+3o77BlFZ+2K+1zJsn
         rhTjT9cz4V7m2R0yCBDIM13Fz4gIzR18NzVxlgiIyh2nbBUdL8lRb3elSoo7epZtBUmP
         x09E/CnngqGiLHV9oFftsszQL6M4G5Wef301v0eui/lYM2HwisMttTUJjl3Dq0U1rSiD
         a37S99O78At0jr8gQjwQYVRs/+i2cNnFvSwu3B5skYmiiR0ggcZih0xAIq7GQidu7vdI
         ffGZxUqrLtpOmAtGJmspjL0h1MkfNTGkpu/Wctv/1fnbsFYU9UoXuzvMCLN9BCBY7kZd
         hYzQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCUtEwSAbBITJLpERVDrtJp1A+Odj46gLdAAM4PPUStcj1/veRTtnPGBMw3YyO8BIAiV6XIZJxcs1Y7pyD/LguciXd1ZJlAEwKkh0Ag=
X-Gm-Message-State: AOJu0Yz8Q7Sa0prk37GjlRPmSTu+/wkj/vFRPAVLbZsNMdbQvu5Ljyvm
	eTa7DS47VOO2IdHz03SqloibkcVwfu0jT2H6DHSGoVIte1yGQPDG
X-Google-Smtp-Source: AGHT+IGbwGXnz3Hd0aIN17puu9ds0uunVFBZAX4L5cm6jF30FoDm1/7KRk2kZ3PpAuEpVNfIBidRHw==
X-Received: by 2002:a25:bec7:0:b0:de3:e1ea:d23 with SMTP id 3f1490d57ef6-df4e0dc8a06mr2386550276.51.1716393654643;
        Wed, 22 May 2024 09:00:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:1364:b0:df4:e746:b555 with SMTP id
 3f1490d57ef6-df4e746bce9ls1011522276.1.-pod-prod-07-us; Wed, 22 May 2024
 09:00:53 -0700 (PDT)
X-Received: by 2002:a0d:cc8a:0:b0:627:a962:4252 with SMTP id 00721157ae682-627e48a50famr5671357b3.7.1716393652849;
        Wed, 22 May 2024 09:00:52 -0700 (PDT)
Date: Wed, 22 May 2024 09:00:52 -0700 (PDT)
From: Syed Aftab Rashid <saftab.rashid@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <6861c4c5-2c31-41ef-89c4-18e9ae28ea6cn@googlegroups.com>
Subject: Accessing Jailhouse console output without a serial port
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_161860_636441805.1716393652038"
X-Original-Sender: saftab.rashid@gmail.com
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

------=_Part_161860_636441805.1716393652038
Content-Type: multipart/alternative; 
	boundary="----=_Part_161861_1185967582.1716393652038"

------=_Part_161861_1185967582.1716393652038
Content-Type: text/plain; charset="UTF-8"

Hi

I am working with Jailhouse on a normal x86 Linux PC. I have managed to 
install Jailhouse but I am having difficulties in enabling the hypervisor 
(my system hangs when I try to enable the root cell, which of course is due 
to a configuration problem, but I can not see any output on the Jailhouse 
console and the system hangs). 
The actual problem is that my system doesn't have a physical serial port so 
I am not able to attach a serial cable to it for debugging purposes. Is 
there any other way how I can access the data that Jailhouse outputs to the 
serial port? 

Thanks

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6861c4c5-2c31-41ef-89c4-18e9ae28ea6cn%40googlegroups.com.

------=_Part_161861_1185967582.1716393652038
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi<div><br /></div><div>I am working with Jailhouse on a normal x86 Linux P=
C. I have managed to install Jailhouse but I am having difficulties in enab=
ling the hypervisor (my system hangs when I try to enable the root cell, wh=
ich of course is due to a configuration problem, but I can not see any outp=
ut on the Jailhouse console and the system hangs).=C2=A0</div><div>The actu=
al problem is that my system doesn't have a physical serial port so I am no=
t able to attach a serial cable to it for debugging purposes. Is there any =
other way how I can access the data that Jailhouse outputs to the serial po=
rt?=C2=A0</div><div><br /></div><div>Thanks</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/6861c4c5-2c31-41ef-89c4-18e9ae28ea6cn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/6861c4c5-2c31-41ef-89c4-18e9ae28ea6cn%40googlegroups.co=
m</a>.<br />

------=_Part_161861_1185967582.1716393652038--

------=_Part_161860_636441805.1716393652038--
