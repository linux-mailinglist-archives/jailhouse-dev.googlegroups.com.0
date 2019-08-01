Return-Path: <jailhouse-dev+bncBCW3RFO4ZUCRBKHRRLVAKGQESQYWLBY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x339.google.com (mail-ot1-x339.google.com [IPv6:2607:f8b0:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4EB7D8F5
	for <lists+jailhouse-dev@lfdr.de>; Thu,  1 Aug 2019 12:02:18 +0200 (CEST)
Received: by mail-ot1-x339.google.com with SMTP id l7sf39117429otj.16
        for <lists+jailhouse-dev@lfdr.de>; Thu, 01 Aug 2019 03:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HX+mp5DzKEQb66LZ5aPbyLClXAwhtooE+MImQTKDIYw=;
        b=Q4dIm7CJvbaa/z/aOoOhp9wP/f3d1KJ96h9ZX/b1MzqiHwm8uPU+4QDsLD+cD+Gvlj
         RGEIHvx4YIEqKw5xwGQuUKTjN0tPwivXdByrOMOXwApVVB310/GCmrAaVLjrA5qTQZ2g
         YQXblfIx2PYiAZYhE5YukqhBJ6IYrUzpEofXPCb3830ZBYLgYVLNxmU3I2fTMnB+r9oQ
         PWB4CDKEmCrkyPpGbdQCIR8BKFO1AkpxtpDq79ECtig5g5meLYxBEEjbebdYSiaFk8CZ
         gRtLXpC0eHGduv8rysP2LmXG5tT43ooDPbY83QL/KKDByx4WOeBO0KT2GhuohVGMcWrb
         UXFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HX+mp5DzKEQb66LZ5aPbyLClXAwhtooE+MImQTKDIYw=;
        b=M5gNrt2r0KhnpMQoShkgLpOeMxGiQ2+VuD1id+pfpNrcitNOHHaB2rilWPPNMXJKDr
         ebqKdYrEBP7VPz2JXxH/4Iy9kN8DLntWDx7zdqNxS/UPr0nW/oYQfbIZPad0sxJE44Xf
         oSnMM6MKtDIIswRVgqQEQhc05q7dspxSst57wUiuNsT/7b8m0YXmVhJKmXsT9Z2ah80G
         ggiI6u/3t1LlKDmoWSmb1Dr8OFIH3Yp0uFLSkVvYbTTn94GLBXJs9wsDJGzbcwPmdA8A
         AfGsCmPstXC85SEUSqMSuIQR9FxoM/yBHSuThajzjJXGQulgrubOLvis2lCGCK8nKcgs
         SjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HX+mp5DzKEQb66LZ5aPbyLClXAwhtooE+MImQTKDIYw=;
        b=fQ2CZE63zN74CZROfwiduWtguvavGXkQZox5gB89u9c/4ndJ7+OUhOt0r+w9yTHJdw
         W96K3Kg3ioopAxwlbVDCY8cOovjFCRskYlOcMD1ddhMVUvWfvZfKrBbNylgZ9j5mKFXZ
         EuOaAEA0AswSJlP0rrpJ/QPL12fHlswEBEK6fkcaNpE553j+VMtLmx3993IfKhZEBomy
         i5YQzaAkUH7rfxXqwTLl8qF8Rj572ZzXGv/42U76mXvifKajgqyTsiyEpETyYMpWB0cp
         Pllg9k0grwkJYcjQ5mjNGGLqLXW2+WMZqVwNDkVtacrB4uSi1I9HNFydBVdIwCdp+udS
         ExMQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXIxk2BolEh1NcWAdYNqguRu87FMpTjIoxv4s5qEXOQJD0aflVW
	H26iQCBSzm88mpKTmlutaK0=
X-Google-Smtp-Source: APXvYqwtzmLaFR+omcG9X0YUmgAtxR62t6KMSwEwmUMh7nmnGk1qUySHLGrh3gl59crYBz3pBRJ5cg==
X-Received: by 2002:aca:c592:: with SMTP id v140mr56564890oif.133.1564653736538;
        Thu, 01 Aug 2019 03:02:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:4804:: with SMTP id c4ls14343088otf.10.gmail; Thu, 01
 Aug 2019 03:02:16 -0700 (PDT)
X-Received: by 2002:a05:6830:1209:: with SMTP id r9mr229942otp.128.1564653735901;
        Thu, 01 Aug 2019 03:02:15 -0700 (PDT)
Date: Thu, 1 Aug 2019 03:02:15 -0700 (PDT)
From: sebastiansaueressig@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <eac59b7f-0f8a-447b-89d4-24f933319910@googlegroups.com>
Subject: Disable RTC
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_169_1950422023.1564653735243"
X-Original-Sender: SebastianSaueressig@gmail.com
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

------=_Part_169_1950422023.1564653735243
Content-Type: multipart/alternative; 
	boundary="----=_Part_170_1665081436.1564653735243"

------=_Part_170_1665081436.1564653735243
Content-Type: text/plain; charset="UTF-8"

Hello,

a short question that doesn't have so much to do with Jailhouse directly. 
My root cell and my inmate cell (linux) both try to access the RTC. 

Unlocking them for both in the .pio_bitmaps is certainly wrong.

I could now use the hammer and disable all RTC things in the Inmate-kernel 
configuration. 
But I wonder, is there a more elegant way to do that?

Possibly via the -c "console= .. "? or in the GRUB_CMDLINE line?

Many thanks and greetings
Sebastian Saueressig

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/eac59b7f-0f8a-447b-89d4-24f933319910%40googlegroups.com.

------=_Part_170_1665081436.1564653735243
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><br>a short question that doesn&#39;t have so mu=
ch to do with Jailhouse directly. My root cell and my inmate cell (linux) b=
oth try to access the RTC. <br><br>Unlocking them for both in the .pio_bitm=
aps is certainly wrong.<br><br>I could now use the hammer and disable all R=
TC things in the Inmate-kernel configuration. <br>But I wonder, is there a =
more elegant way to do that?<br><br>Possibly via the -c &quot;console=3D ..=
 &quot;? or in the GRUB_CMDLINE line?<br><div><br></div><div>Many thanks an=
d greetings<br>Sebastian Saueressig<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/eac59b7f-0f8a-447b-89d4-24f933319910%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/eac59b7f-0f8a-447b-89d4-24f933319910%40googlegroups.com<=
/a>.<br />

------=_Part_170_1665081436.1564653735243--

------=_Part_169_1950422023.1564653735243--
