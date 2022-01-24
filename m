Return-Path: <jailhouse-dev+bncBC653PXTYYERBXN3XGHQMGQECFG5MTY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x837.google.com (mail-qt1-x837.google.com [IPv6:2607:f8b0:4864:20::837])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6B84979F3
	for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Jan 2022 09:05:51 +0100 (CET)
Received: by mail-qt1-x837.google.com with SMTP id u23-20020ac87517000000b002cdd58d2951sf6032202qtq.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Jan 2022 00:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=g7+mpjvhUmPaOs9IXA3V1M2SbWQSPDrKqdDe8ylG5Xo=;
        b=WRVCdhx1TyfeCpLewlwZEzLPNgi/MP6JpKnHMcY8SUQcGf8XGR9UmumgeYUd+lsKQg
         PTSe0HJwWDZCc5FtENqnzq89aX9o7pyjFamoMpVjfHIOBcqaW8cmEijZkwKJcrbQUmWj
         hMiZv4PZTofEFAzvkSeq2sfnNTcuwQLfVusjzNOG4Wvq686EvRJDlYh9bN8KqLp8Taux
         TQf16I8ih2GbA8eWfIo1B/XXqfw+m+luTLciLxt0iRYHg/N2GO2HQK1Br12zU3NdA6b9
         XEao19E99zpuzdI5zrD+R4nxP/fKCBAYv/dv5Wea655WyJE/Q67WeIjDi1Cn1BgQSPqv
         MLIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=g7+mpjvhUmPaOs9IXA3V1M2SbWQSPDrKqdDe8ylG5Xo=;
        b=GGHIlJrC+2p2eVY/Kz7AORJ8sYFGDHEN/vrUtSe/5izLnLb/9KTqT4P5ZHINGwG5B2
         /z0/r6uvSv9LMiIofLVtUEwZNzrVhs/jMFeX14H2wXHcfc324P6N+e5Imd2TfU/HwH6x
         3BOefrJ3ERX86RFzXCZuheHGz097UO8D7FAKKKfkUdVlUgRy5ZKMEP6eB0zHDNIT/Y1o
         J1rvUHOqq1IDl5uM+VIC8Bph7iuW1EB3Wg8ZYbzcC6tHyDPLtP7AmEak/9fb24cn0FGQ
         GwWyakKeNJUwYR/rHvlgb9VGr7DOM2NSXfFjVdhGLZtn75U5ue8TbDcc6t83rVYuY5aN
         L5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=g7+mpjvhUmPaOs9IXA3V1M2SbWQSPDrKqdDe8ylG5Xo=;
        b=DtlJL0iDVyTQZrPaIwfmmG926AkjPpnhNG7dpBMZRlQGqFV/oBQCx1acnda/hGFUua
         KxTi8GFxMQbteQhnqggyGstRzFLxUtTue+MZSNRjRkZUVwPN3N1CxPRNnZHOWlhdr46w
         hUP6VJuEhmwxJevMuYk5+kYQXr8kNhLd0TnknenSuI/ksHyFcunc9gEezg73l5TEKRSU
         YsJMGySWd4qgU58y/3sAwGnjLJDkhs45760O0GoUsB0MsuBqE+dzTtmU+3+Y/pSkzsnz
         7cTbtbzwARnjuON2kjAciYWfPiLQrdhMBVqTK4KWhDF/0AR/B40IwmvOfnzdFsgPykKg
         /8WQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533OcwcMi8gdIqN9Ey+K73NQsGd5AbvPVqtXUX0YaCCiaxE2RVHZ
	jru0/gxfhH+SZwUZ5mWr8MQ=
X-Google-Smtp-Source: ABdhPJyWloCZS2cfBv/02QNAOcBXRVdyB3SBF7IEIFrrskJlqfna144UVFRU0ifWNgdkZxumloQLkQ==
X-Received: by 2002:ae9:e80f:: with SMTP id a15mr468971qkg.652.1643011550057;
        Mon, 24 Jan 2022 00:05:50 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:8e0a:: with SMTP id v10ls7299837qvb.4.gmail; Mon, 24 Jan
 2022 00:05:49 -0800 (PST)
X-Received: by 2002:a05:6214:27ed:: with SMTP id jt13mr13438376qvb.32.1643011549023;
        Mon, 24 Jan 2022 00:05:49 -0800 (PST)
Date: Mon, 24 Jan 2022 00:05:48 -0800 (PST)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c9fd12f7-f03b-4f96-afa6-ce4401a9796cn@googlegroups.com>
Subject: IVSHMEM Bug?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_846_879643375.1643011548011"
X-Original-Sender: mustafa13e09940@gmail.com
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

------=_Part_846_879643375.1643011548011
Content-Type: multipart/alternative; 
	boundary="----=_Part_847_2013569743.1643011548011"

------=_Part_847_2013569743.1643011548011
Content-Type: text/plain; charset="UTF-8"

I saw your presentation in [1] and what I understand and also experience is 
that there is a bug of disappearing peers. I have four cells in RPi4, three 
Linux, one bare-metal. Any combination of three cells work fine. Only, when 
I add the bare-metal cell, I lose connection to one non-root Linux cell, 
yet the cell does not stop, only the TCP/IP connection is broken. 
So, I would like to ask if I have a hardware limitation, something like the 
MMIO memory regions, what are they, and do they affect inter-cell 
communication? 
Do I need anything else than memory regions to achieve inter-cell 
communication? 
Does the number of physical PCI devices limit the number of peers?

Thanks in advance
Moustafa Noufale 
[1] https://www.youtube.com/watch?v=TiZrngLUFMA  

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c9fd12f7-f03b-4f96-afa6-ce4401a9796cn%40googlegroups.com.

------=_Part_847_2013569743.1643011548011
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I saw your presentation in [1] and what I understand and also experience is=
 that there is a bug of disappearing peers. I have four cells in RPi4, thre=
e Linux, one bare-metal. Any combination of three cells work fine. Only, wh=
en I add the bare-metal cell, I lose connection to one non-root Linux cell,=
 yet the cell does not stop, only the TCP/IP connection is broken. <br>So, =
I would like to ask if I have a hardware limitation, something like the MMI=
O memory regions, what are they, and do they affect inter-cell communicatio=
n?&nbsp;<div>Do I need anything else than memory regions to achieve inter-c=
ell communication?&nbsp;<br>Does the number of physical PCI devices limit t=
he number of peers?<br><br>Thanks in advance<br>Moustafa Noufale&nbsp;<br>[=
1]&nbsp;<a href=3D"https://www.youtube.com/watch?v=3DTiZrngLUFMA">https://w=
ww.youtube.com/watch?v=3DTiZrngLUFMA</a>&nbsp;&nbsp;<br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c9fd12f7-f03b-4f96-afa6-ce4401a9796cn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/c9fd12f7-f03b-4f96-afa6-ce4401a9796cn%40googlegroups.co=
m</a>.<br />

------=_Part_847_2013569743.1643011548011--

------=_Part_846_879643375.1643011548011--
