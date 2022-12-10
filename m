Return-Path: <jailhouse-dev+bncBDUK5F6DWYKBBAPC2GOAMGQENKDBK6Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x1137.google.com (mail-yw1-x1137.google.com [IPv6:2607:f8b0:4864:20::1137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A470648E7E
	for <lists+jailhouse-dev@lfdr.de>; Sat, 10 Dec 2022 12:44:03 +0100 (CET)
Received: by mail-yw1-x1137.google.com with SMTP id 00721157ae682-40306a5a42csf78602717b3.1
        for <lists+jailhouse-dev@lfdr.de>; Sat, 10 Dec 2022 03:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVbXzoQ64C+Y0dKYlAMZcL8fkDoQvtn8Kc9OLPsfXA0=;
        b=q9iLDUQ/JVKW/5UDGAXPPtrk1t89b9/D26VgbdyOdSFVCnpOLGfwU5zEuukMNkFFB1
         WD/iaRc/THr4GeiGi9vz62YRINiZWP6UMWanS9Q2wvpIfS4wJriZBfYZRV4rAxMeN0cY
         OThstSmKDBAXho0aR3BfYWkFd2OCn5ZpK5OsJQ1fP6/lkQWdBYCcgVYT9qndyjxR4kED
         q0PlJXz2h/qgh1IFypQzB1PWbJQHqm7W1kHhQdwKk10cmlJRw7RS8ZI9iboOVP+VqdV7
         W6rTRxQj6OZi/fYfyPNl3TxnGIvkgVQ7hkrxNaZQQMLL5WvGpkvzP4iG4aObYhz5aF3r
         elew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatslice-com.20210112.gappssmtp.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iVbXzoQ64C+Y0dKYlAMZcL8fkDoQvtn8Kc9OLPsfXA0=;
        b=5YuF7jUagOLBw4me5duP2aMzC5LfPHlQcsm6qgJtEoX8RL2gutd3xTmnpwxwcAVcCa
         EnhSMj9jZlfCIZGpTpv/ZAUgFGcwVLpSCmhwISDWfmnNXTG1v+n4glgz3lGn3KVk+dL9
         uIBPrYW5rza3T/HjIyTLfR+3NJUknq6J5xKJi4m0iRyWT3RwNjQJUc3QijnhLq5wKdPz
         aKzJxGUALq/AuiNTCOFrMlX7chI5gXqJeAD1K1Fy37Y5J3X3dtTosIIdp2RJassPBEOH
         0+oUEnZ2q+9g/K0mFmV0hg2gbZf425XOU6uWK2cnHztAE1iobRdIlU5nYyEQuR1iRQu+
         y2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iVbXzoQ64C+Y0dKYlAMZcL8fkDoQvtn8Kc9OLPsfXA0=;
        b=xwH4v4LP5sQvvhoGWzcZ7rtqQHI8AM0orvX+Zb4qf/VhgpoMmj0+14uMg4XyjZI8FM
         tCbzkbV9zKw+mexQiBRYFN8BjPDgzIk2tpoeeOnLwXZXyJusHMELwRwhu+QwC5obWQgL
         ZV4RL4QRilAQZTt1YzKU8krHVnG3ciUnRV9T1WiOQzVsa/H5o1CzZoFLG/+xa9Mo4o0T
         xSIabqblvuAVP+Yu3faIBwg0o90LYgpJK5pA32sK9ZmfZFYeWengqS3ReZ4uDDzKef9W
         6Jc2WR0HEuJ4tzqvTKF2chHB3/8aiIRceyRKeeDrqiEohFinMJ2SFlFahYVfUaHMtiEK
         Hj5A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5plsuoJISjmSHpKdexU4PUilT1idJKC33rd2X5z8d0MorEdMqbJf
	aqRoxxesGfv0INPfL2BnaG4=
X-Google-Smtp-Source: AA0mqf7v2wd+XhzXaHdl7nkkwJf9YKOHqjwpTwwuxw1okx7AUeeQbpY5syQcHC/A0KMOYHOe9WqiIA==
X-Received: by 2002:a0d:df54:0:b0:3dd:bcc2:e359 with SMTP id i81-20020a0ddf54000000b003ddbcc2e359mr29250127ywe.341.1670672642145;
        Sat, 10 Dec 2022 03:44:02 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a81:9845:0:b0:3f6:22d4:3288 with SMTP id p66-20020a819845000000b003f622d43288ls6256348ywg.11.-pod-prod-gmail;
 Sat, 10 Dec 2022 03:44:01 -0800 (PST)
X-Received: by 2002:a05:690c:d81:b0:3b6:4fa2:1a10 with SMTP id da1-20020a05690c0d8100b003b64fa21a10mr625213ywb.48.1670672641099;
        Sat, 10 Dec 2022 03:44:01 -0800 (PST)
Date: Sat, 10 Dec 2022 03:44:00 -0800 (PST)
From: david <david@fatslice.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <5ec7fec0-8495-410e-866e-ad9c05f41663n@googlegroups.com>
Subject: any jailhouse people in sweden?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3234_2087597691.1670672640476"
X-Original-Sender: david@fatslice.com
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

------=_Part_3234_2087597691.1670672640476
Content-Type: multipart/alternative; 
	boundary="----=_Part_3235_500748856.1670672640476"

------=_Part_3235_500748856.1670672640476
Content-Type: text/plain; charset="UTF-8"

working on a multi-core project needing some support, preferably on-site in 
stockholm

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5ec7fec0-8495-410e-866e-ad9c05f41663n%40googlegroups.com.

------=_Part_3235_500748856.1670672640476
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

working on a multi-core project needing some support, preferably on-site in=
 stockholm

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/5ec7fec0-8495-410e-866e-ad9c05f41663n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/5ec7fec0-8495-410e-866e-ad9c05f41663n%40googlegroups.co=
m</a>.<br />

------=_Part_3235_500748856.1670672640476--

------=_Part_3234_2087597691.1670672640476--
