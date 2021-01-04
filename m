Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBJWDZP7QKGQECZZCBDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9CD2E92AB
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 Jan 2021 10:36:38 +0100 (CET)
Received: by mail-lf1-x13b.google.com with SMTP id h64sf16693666lfd.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 Jan 2021 01:36:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609752998; cv=pass;
        d=google.com; s=arc-20160816;
        b=y7IVuNmKiZZ70z7VIL5qs0TmePUe+Q2zDxIFGIBX240NESAIDldQLPehtFL6svAKC4
         Op+khmNpsAPvvCAHay82mVJL6+FGRoxKPlhEYckmUBt0vfufYEGyinFIMpG8rdc6ngYR
         z5whxld+IfFU2omZ5msBCV3h2snzFXszciPQBalfFP8TDlCeY4zWMH6PRnmQ70HM7g6g
         GVByT9/J5y/hQH+Vs26GWFX5Kv0fxdcLO9R1b+he4OjubdjeP152CWbgEzZt6IHi/L4u
         Y8yoACx2k5aMP61Mp06HX0wWiVR2RvQSoMaQUqTVxHugZPysKiCt40H812hPkoRBklyF
         QvZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=s71tn3TlYKuNifHWbWgo9bd6tNRBZhZphWQIZqwT/K8=;
        b=gc8ZZpOP9JsP9FbkkPGQb7PkFWmAgyF8l0blCi7EuBaCD08xQ33eYCmlwwq5HR5thb
         1Tb7HxXHFSazUP4S/HLy/2Q/6Qp8w6SN86CmiIS4ooWkwRqr3I17ghFFhNh7ZGfGsWto
         Z1Qg/GADMS06BbR2Pu5itYZu9yQfAWFcEC9IYoPq5u/3Ick6PcvT7IhnZtJToRT+IO+S
         KjYkJ0vyB0ygij08CVuE2BSXChAITJURJRTAQeSPw0mdHcPpY/4VECU8OSbQGAMzsPjB
         w/ARpM9DNwqV6zpSvtiFap6QIaMET0YYJJzT2t6vc1JEefGf/xZ5B9X+Hid4jVjSTJop
         ZU3Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="co/V/RI5";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=s71tn3TlYKuNifHWbWgo9bd6tNRBZhZphWQIZqwT/K8=;
        b=Ual6n2kztPu7QEwHTbwbRaa5IGNmD7YLdTkZmIziCcFqM6LDqGjJjYHPUhoy4exBeO
         QXkcKMj1/DuYccmsO6z1yiWuDxSocEOAL9IsDZauzih9XCcAai1/GzwYpVqdK/eaoZ/s
         iGS8QsVZ8MwMuShEgoJYKITzQNBgs7asYkU1Lr5rElLVhYI+cUATHXxXtwE8FyDHApKJ
         2A0Mvz5V2oLhQfh473IF4InWhxlhUeTN4tKhhuYpTeRaOM9yjVs/99RwNcy0BuQtYI+Z
         KVnaKM3GXyn3HqlJmEsr/Og9GJm9kLiKE9cwkn0fGHtD7V8GVr7XN1wUtPKQmz6wYArW
         dMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=s71tn3TlYKuNifHWbWgo9bd6tNRBZhZphWQIZqwT/K8=;
        b=Ll0TQvm/4bp8pib1DJ9fClYJT7ko0W21Jfgx1rRWuC0zg7DCIrm9iIbobk22KHXXWn
         CKQMf4QSxTYesBdB9Tja2C2BrHq5ccVR6QX+iBUCSkXXhgkybgYK3YMjSkQU+Ua0K3K6
         xVbFomVvl/W8fZTI1ZKiaDeSplI2F+Aory82TTbpdSQeSPTLR64sSLZRMCbUEIr+0Lxi
         xQVvNJ2Jm82ZdxZUO8Ag9+FpG3agSUUPN9khjX84ibVsShO/xX0O+Yhmg0e5A0mnzYQ2
         ia1QBFFkyiHpkBUNWTzcVuxJm+T3tot6xRoziyw22ZBg6YTZGXMad3Sp4rybKYF3NrVs
         H+kQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Tj0PKFSCvEhk9MYMqxk8WUbFUqSMA9PdYRZWm69MzeFpWz/Ut
	q+U5GuUHndU9Y22UTh1Uop8=
X-Google-Smtp-Source: ABdhPJyCgtBJ0X9sRKbfP4AfDLAUnkCoW/k1OTblY0hp+bZeWhQDcQOyVdJ5sbjAa7t6RTVcncr+Mg==
X-Received: by 2002:a2e:2417:: with SMTP id k23mr34703168ljk.373.1609752998532;
        Mon, 04 Jan 2021 01:36:38 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:10d4:: with SMTP id k20ls4777770lfg.3.gmail; Mon,
 04 Jan 2021 01:36:37 -0800 (PST)
X-Received: by 2002:a19:5f59:: with SMTP id a25mr33602891lfj.310.1609752997498;
        Mon, 04 Jan 2021 01:36:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609752997; cv=none;
        d=google.com; s=arc-20160816;
        b=hA4MAIsZ6SBhMmhUJV8fpePeTu59tqgEpXe27EN4F/2yrDZqBg0H+d/tvgyi68Cnmj
         jXqRW3sbey9h3VBNmZAeVexFOBWJrWWuHULxKb0bzV2AOpqgGZkFcun847GNjN2s+Yp/
         fuZcAe+yKUDOsoCV1IYugnRS1j7fwr/N6XFZrTvOAR0zEzhww39ff3YnqUra0enCChI6
         DHh/KGzBsbvZpcQXrQV0xqKAmtvgOWAjvG1vmHXEc2PNkg6Sf1rrX38usXT9AAGok2y5
         89SucwMiPgpVVwg1hZqHY8KXk/++Z3iyCBGx4/B8ngxWwe2DDEAEV6Fz0WAEnf1fu59n
         OPHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=e14a185T58wghQNu84rTOK7OvXMrPONpV0acdUTcTZ4=;
        b=jpdb2BHJvKTmeVQZ7rwevjg04HT6zs3kT40kLDbXwq26Gnhqu+ggJ8Wago1ZH9jigZ
         3o0vTEdNdlgnfPsuLg+9+kCHkygkkOty1PdYuKqIv/H5tIdkUKvPLvhZSbyq3ovRydaJ
         8YF6zR1H6CKzE/LU2HN/LzZFAL6KDrXltrS3exFGpREjsXopzXrtOgNGKTcdGYc+K4XS
         C+ko3dRyXkrMqHZpyzjnIU+LReSLJUU+KSHB6TXsLezQsCHlC7Z7B5tr9XfYEXWVfTDm
         a1bErR7zH1gDYAsJkhSyL8GCI5DoPsVkEKXR2a/5V3BuKXs3pyIzDaeNzLVI0HDgfFSy
         bVSg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="co/V/RI5";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id d3si1826247ljj.4.2021.01.04.01.36.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 01:36:37 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([88.215.87.53]) by smtp.web.de
 (mrweb102 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0Lh6QF-1kAdX93CJ5-00oWVi for <jailhouse-dev@googlegroups.com>; Mon, 04 Jan
 2021 10:36:36 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 4/8] inmates: arm: Enforce soft-float ABI
Date: Mon,  4 Jan 2021 10:36:18 +0100
Message-Id: <1c3a9508644c5f1d9fd5d6d0cdc8caf28c90b35c.1609752982.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1609752982.git.jan.kiszka@web.de>
References: <cover.1609752982.git.jan.kiszka@web.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:jIbzFzVV0eqk6CkzJBuOFJx9a52IdyDOqQvnraxhPlI8coOLXI8
 uoKbjHhJH5MANa31Rj5VXZ6Zzbq/6V/u/yVCN2LjEkCGKjj0thK3u4HjSSnz9SGcJbbHD2r
 BzTJuQ5z6JDdX70omFbghJhv2rfgMyuozQjAxblttMHrS7OdUw9OEGjYQKElNP5jukL8rIp
 p7X/NJ/xXzA2Jq+kdJILQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SlHtOJGlFJQ=:8L7Iq9q7IMjkkqXiH4CS8d
 ZID4/VIj4g/5a8RvBW/+dYtmvshSsyoSXb3QtUgdzqAZ8Br5x3vr7LPw44tZ6Nj3CNdRZ2lTu
 4qheUHcNGlDRkMoC4RvKQlnMA//XIUbK0EuoOdOTpTA6AuJciyFj8MMbRWLut0zdjQKePMb/R
 YXERo+Jg8rGuHZ+C0OchaRVrZQ8qVn9UV4WSC4dL+0zMZYHTPMPSoo4gTBD4dNPNKAEVDcepP
 dzDz2Vif4KKiwgLqSumAWwTm/PY+pw1FZ61XE1mADD4PQeabWUIObGfetxuc1B7xVY9YmtmQl
 VCzCQMa0+ewxoBGvUzEehWaLP16W12u6PBW8c/Z42wWs86ENRRreiS8debc0TvTqSNU7Acznd
 fpmPA2lE0wSk46UpMcHq0px2G7SPjg81mzZZb8R9spEztfspEosPDcBQT5OuRnTKBcJIp9aTP
 Wjoekuiy4ZmKjpiwUDg1yPs9hwBm4TZ468labV8wFYGSn6cvxt21vAryy87C2d8FVWEjrjcPA
 xWn0B491rwzU7D3qCfs5ZbpWup5Htke5asuj78U1u/DjmsRqKXC//M89qG+eja3Q1W9Wp9RPV
 1u9BZQu2PLd4eVmvCt1NVcGG+ZrXrscDJ2BuYSpqgRp3OwDqJQ6WzbJgQoPhWHCUeJkFDTEnJ
 Zv7T4jXiMTWNMjGUUWuWl+XZHUhm75U4MoB1jsEorh+8Sdl5BRdOlsx84reO44NTE1uWfU0Sk
 8rtdP0wQGfT1oWphhHHe6bpxr6zawP1V8TVm7BBJnzTJu0vVK00zgr5bG7Q7uYDSQG225JJCT
 R/r8wMcXwqVe/yCHOEFna3LGPwbVCBQjaH+k7QYFZ3JjEAF+YVqz0VANxaG5X87he9tgYMQsx
 HToFeDtmP3DFlomEn9aw==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="co/V/RI5";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=web.de
Content-Type: text/plain; charset="UTF-8"
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Analogously to the hypervisor core: Our inmates do not set up vector
extensions, thus stumble if the compiler generates corresponding code.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 inmates/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/inmates/Makefile b/inmates/Makefile
index a4ab7903..b4d4366c 100644
--- a/inmates/Makefile
+++ b/inmates/Makefile
@@ -32,8 +32,8 @@ ifneq ($(wildcard $(INC_CONFIG_H)),)
 KBUILD_CFLAGS += -include $(INC_CONFIG_H)
 endif
 ifeq ($(SRCARCH),arm)
-KBUILD_CFLAGS += -march=armv7ve
-KBUILD_AFLAGS += -march=armv7ve
+KBUILD_CFLAGS += -march=armv7ve -msoft-float
+KBUILD_AFLAGS += -march=armv7ve -msoft-float
 endif

 OBJCOPYFLAGS := -O binary --remove-section=.note.gnu.property
--
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1c3a9508644c5f1d9fd5d6d0cdc8caf28c90b35c.1609752982.git.jan.kiszka%40web.de.
