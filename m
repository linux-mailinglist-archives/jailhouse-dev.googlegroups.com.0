Return-Path: <jailhouse-dev+bncBCBONH5NZ4MRBRPY6WYQMGQEYE4SDCA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3a.google.com (mail-yb1-xb3a.google.com [IPv6:2607:f8b0:4864:20::b3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 605E58C1C30
	for <lists+jailhouse-dev@lfdr.de>; Fri, 10 May 2024 03:45:43 +0200 (CEST)
Received: by mail-yb1-xb3a.google.com with SMTP id 3f1490d57ef6-dc6ceade361sf3132022276.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 May 2024 18:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1715305542; x=1715910342; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXTtHLilyqsjkPRK1zLptEPNhLyhRcVPdH41BOBnGkA=;
        b=f5iSxq+4d4qyA7BAJJHYYr0ISlM2nZaox/Db4tU7czzy5IIzI4bNriWGGhv/QExmBw
         +kkd1l4J8HN/QPEFWdrndREzKP0Ia6p6v8TdG4VMD7ZwgvgaQ2qJhO9G95/F7HgCUQqG
         T3MNpYRpRl+WRP9P5rP1H7SEdEJl1nEu1vqMOeGhcfEEiGsH7dFTadTCNzwtyoJg8xgc
         pThZzdHyl3imfEAUixNlEptJxV0/ZXF4w7dy8vh6HUtaknRmODchCJm+iBXZ+/3yEg+d
         gzIUscJxB45QkaKKh7uY5U8/zrL6pxxavLrL4pyDdjXRc2+iKrASq6LIBvGiYRSxju3Y
         BKHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715305542; x=1715910342; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dXTtHLilyqsjkPRK1zLptEPNhLyhRcVPdH41BOBnGkA=;
        b=Ohnrea5aoWAYUhMEFJTNCj8TYyhy21wpdvtnCQFsQOBTZmA+pN7oMQieZhdCFiw2+z
         qgA3LKBepUUnPeGqJH7snAuEvjOO4a6W5ujHY9uDWYlEvdzNa1lcDllp9iXFSZgBKfaV
         uJF6aYW6M5plcVivNFbPw/ApTlzBacnRoRh28dB23CLIfdpX3ahWfgIK8sOWFwq8hbMF
         fslq9XAMtRiqWoThmqGt4FTis7RWJ+3q22npnu5OnHjEZE7J1XyqH/f09GVeUVDWXhSR
         QTg60WrY9bCYQ6jJmqQivMW/O61tsGjFaKICyuskrUVQEvAe6Ged3m6ufVdapbpq8J/f
         FIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715305542; x=1715910342;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXTtHLilyqsjkPRK1zLptEPNhLyhRcVPdH41BOBnGkA=;
        b=JxKRly9Sco0S+uAZyNSFgNTXexwqv0DlwXx+dH+t7Lua0cLvo6/1ht63z3d0+STRKT
         W15LW7m6/q5Y5oT3p998nKafnoXXqjbGI80W8SYFz6N32gxQDwiKoiCjGlx02kxiYL4V
         9gFvZLyj3as1XNUZTD8Xxd0YRd8j/jnkkf179Q2cDu0Xh902xb4S9lSW/kTUAGOqVIlu
         m197JQ2abt3waLTW5Mg6/G/0zSPee3QmEXJ3qVvI5UvxH5uvPkD4Kf+xhQ/ELRSiavci
         bViWSpj1kdmEsLsPgYhkkujv46XgMSPqDIR82a4CZAOcwrIkwnXvOsaplZLeD2nyajHk
         AihQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCVQh3LkObpPKf5hbHUl+StVHE0ZQIaYSNEzQ1QpEFQIyXGCiNhTSgK19azJII36d6Lum9WOaghwfASjKLWvLANW4D6Mx/oF40M3ws4=
X-Gm-Message-State: AOJu0Yzim4XIU8wyq1+ekbIRtIjAlmo6SFmu2NEhzVEs/Fg/RiHGO8Tl
	B5gA3+wcmWjpLrcT8aftDEEXjwQg4LftqU2qK5At2FQTc5zz1eUN
X-Google-Smtp-Source: AGHT+IFACxfC6/Snpdz1925CV56w9nCRfOi9o6ObmrV8Ksx/0pFGdWYrEEBFd6mbqUXu3SuKczMOqA==
X-Received: by 2002:a5b:9ca:0:b0:de5:9e4b:4c97 with SMTP id 3f1490d57ef6-dee4f36b0admr1271647276.38.1715305541915;
        Thu, 09 May 2024 18:45:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:e0d3:0:b0:de5:a004:beb with SMTP id 3f1490d57ef6-debd0877adbls2051094276.1.-pod-prod-01-us;
 Thu, 09 May 2024 18:45:40 -0700 (PDT)
X-Received: by 2002:a05:690c:3808:b0:61b:e689:7347 with SMTP id 00721157ae682-622aff75547mr3139777b3.2.1715305540063;
        Thu, 09 May 2024 18:45:40 -0700 (PDT)
Date: Thu, 9 May 2024 18:45:39 -0700 (PDT)
From: jerry lee <jerry1372071341@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <955a4940-2ae4-4bf2-971b-8339f3d77c04n@googlegroups.com>
Subject: ARM using jailhouse
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_10058_845411797.1715305539298"
X-Original-Sender: jerry1372071341@gmail.com
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

------=_Part_10058_845411797.1715305539298
Content-Type: multipart/alternative; 
	boundary="----=_Part_10059_2012521074.1715305539298"

------=_Part_10059_2012521074.1715305539298
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'd like to exploit the performance of running two linux and RTOS in my NXP 
imx8qm mek board, which can communication by IVSHMEM. I already 
successfully ran the test demo of jailhouse provided by NXP (actually face 
some version correlation problems). However I was stuck in how to configure 
the cell file. The address is virtual or physical in the root.c or 
non-root.c? How the system work?

If anyone could share me a document/tutorial to help me figure out how the 
dtb , jailhouse and configuration file work together to make the system 
work. Thank a million.



-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/955a4940-2ae4-4bf2-971b-8339f3d77c04n%40googlegroups.com.

------=_Part_10059_2012521074.1715305539298
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,<div><br /></div><div>I'd like to exploit the performance of running=
 two linux and RTOS in my NXP imx8qm mek board, which can communication by =
IVSHMEM. I already successfully ran the test demo of jailhouse provided by =
NXP (actually face some version correlation problems). However I was stuck =
in how to configure the cell file. The address is virtual or physical in th=
e root.c or non-root.c? How the system work?</div><div><br /></div><div>If =
anyone could share me a document/tutorial to help me figure out how the dtb=
 , jailhouse and configuration file work together to make the system work. =
Thank a million.</div><div><br /></div><div><br /></div><div><br /></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/955a4940-2ae4-4bf2-971b-8339f3d77c04n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/955a4940-2ae4-4bf2-971b-8339f3d77c04n%40googlegroups.co=
m</a>.<br />

------=_Part_10059_2012521074.1715305539298--

------=_Part_10058_845411797.1715305539298--
