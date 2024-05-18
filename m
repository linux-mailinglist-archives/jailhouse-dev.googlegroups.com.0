Return-Path: <jailhouse-dev+bncBDN3BPP6QYBBBMX3UKZAMGQEXJELGUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3e.google.com (mail-yb1-xb3e.google.com [IPv6:2607:f8b0:4864:20::b3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2EF8C9175
	for <lists+jailhouse-dev@lfdr.de>; Sat, 18 May 2024 16:39:49 +0200 (CEST)
Received: by mail-yb1-xb3e.google.com with SMTP id 3f1490d57ef6-de8b6847956sf15149861276.1
        for <lists+jailhouse-dev@lfdr.de>; Sat, 18 May 2024 07:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1716043188; x=1716647988; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2qn8CXdJtmI2yTVV+F4100pqOT8JrWVzvbMXxc6iIJM=;
        b=Ur3BWrN4fr3/C86yuUDpl004X+mkRdxJnjBmZX6AxFwHwLl+REg4IoPsQt7gu5vm44
         hyuh5Jr2pBszXm3UNcOg0czmNRZwFj9HNekpN6wYxQwaXwAQPmAowGR5ESBrbCg3tY1B
         BhmoYMk2AklF4e96dCY1kY7SBIy+Vsc+PaBdcJVdwMf/p88DQU6rQ0g/GB1aZO0m8z3j
         QTvb3sZm5WJ3shZcXKiVhU7LTg1NF3/R1L8+5JfcgtePIxEiAH/tQb0P/EZsTf12FPe1
         qilnjJx11Pn9mn48oAhNqUhoC4xV3JMy4DEzz44p6le0jNh9nIfx2ewg+UZ9BVhybdcb
         AR8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716043188; x=1716647988; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2qn8CXdJtmI2yTVV+F4100pqOT8JrWVzvbMXxc6iIJM=;
        b=b773/yAPbPY4UujxKiDewjsYynz90AdTrFGJlmgXRVtoogxUhYjoYmz2hGTH4aXh5d
         NKiBpYk0sDCsfvDTrU/MwNqK2zSU5aOxFQTeJ8Q/YfRAaMltLSC4O3QOlgklbojR475A
         W8G9xknmA1Ggzz2jpoSlkLSgUwHgGnh3984qBA5LX7V0x3JdrCwwx10MeJRmHnG1vyju
         2fQaXa1jeI3syShxaHUwh71M5VdMRp730PvfFl5HsspMSnlvxtQaIwyfu8i0ll3rQqb+
         Q0Bvteid7Sj30+lSzM513tErgwbNegjgF97VqwbTQWsr73WlXAUc6fHGedcOwtH1EVpB
         Igiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716043188; x=1716647988;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2qn8CXdJtmI2yTVV+F4100pqOT8JrWVzvbMXxc6iIJM=;
        b=ZLvDIdWIH2pDSRqMaKUBofheFTc9S09bIepplkcwMwutUS/SUQTDp87hW3ynn163qy
         nHLy+gT7ZmB8uYTVleyoy6QVwCsQdfHUIi94mwxdeRZuVDj2wU1OGcimoJp4ZVlQvlIs
         OU8RqZo2dHL5U9uaMkJTk/9ys/wH0CyAAfKO/8n3zszUXDZpGIoEJEXXZpOIG3lsDOA9
         k2fgnZfPwxnl+jBGYsZprAFOjx5TT0cfMrF1t5MUIzLK/zt1w9tDrmIkmlHjIfXpFTVt
         iqr7SKTJqNQrL1DMY3+T7WMe318aWs/tovA8ATE+V66gl3j+Fr4VUwhWCGKTOQwShDv8
         XkNA==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCXIui9oZU3/sBal2vVNi3XqAacVZjOViGMDgtQh3GfG9HOxwd3VgQ/aUQDhBptu0j33j/Jf4UTXaWvkjvOfqqpI38unHL5IXjNlcCw=
X-Gm-Message-State: AOJu0Yw2fYaQ/91Sq/EPOkV9JyGbBmOY3xBr/PIwmwVOhspj0PtsRDGP
	9cp9nfwh9mJLktXhsDnrEcJ+FwEpgOZRWUgf7UrGDaNLi+88Rbg6
X-Google-Smtp-Source: AGHT+IFJPlDTdKvejvhDKViTfUmEDCgJpfUL6K1Z4moXNWVDDXDV6pa75FsW+dxfGC1iVlY/3NsVWw==
X-Received: by 2002:a25:b2a2:0:b0:de3:c613:b805 with SMTP id 3f1490d57ef6-df490219fe3mr1469173276.0.1716043187673;
        Sat, 18 May 2024 07:39:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:d852:0:b0:de5:a5cb:9690 with SMTP id 3f1490d57ef6-debd0126c8fls1763073276.0.-pod-prod-02-us;
 Sat, 18 May 2024 07:39:46 -0700 (PDT)
X-Received: by 2002:a05:690c:b10:b0:61a:dcd0:5a61 with SMTP id 00721157ae682-622affdfcbdmr61098257b3.7.1716043185375;
        Sat, 18 May 2024 07:39:45 -0700 (PDT)
Date: Sat, 18 May 2024 07:39:44 -0700 (PDT)
From: Ke Li <cnnblike@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <98597217-94d8-484d-a8cc-d6be44452dd4n@googlegroups.com>
Subject: Necessary change to fit mainline kernel.
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_28095_691379949.1716043184498"
X-Original-Sender: cnnblike@gmail.com
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

------=_Part_28095_691379949.1716043184498
Content-Type: multipart/alternative; 
	boundary="----=_Part_28096_1069759686.1716043184498"

------=_Part_28096_1069759686.1716043184498
Content-Type: text/plain; charset="UTF-8"

Hi, 
Per upstream change[1], it's necessary to adopt the new signature of 
of_overlay_fdt_apply if you are integrating with mainline kernel. Please 
consider approve [2].
If you feel necessary, it's also possible to defend this under some kind of 
version macro. I'm happy to provide a new revision of code.

[1]https://patchwork.kernel.org/project/linux-pci/patch/1688059190-4225-5-git-send-email-lizhi.hou@amd.com/
[2]https://github.com/siemens/jailhouse/pull/31

By the way, if anyone else is also on the same page integrating with 
mainline kernel, I've done some patch [3] that is exactly done as the 
official jailhouse-enabling done here[4] (with minor tweaking so it consume 
latest in-kernel API).
[3]https://github.com/cnnblike/rk-build/tree/v23.11/userpatches/kernel/rockchip64-edge
[4]https://github.com/siemens/linux/tree/jailhouse-enabling/5.15
KL

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/98597217-94d8-484d-a8cc-d6be44452dd4n%40googlegroups.com.

------=_Part_28096_1069759686.1716043184498
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi,=C2=A0</div><div>Per upstream change[1], it's necessary to adopt th=
e new signature of of_overlay_fdt_apply if you are integrating with mainlin=
e kernel. Please consider approve [2].</div><div>If you feel necessary, it'=
s also possible to defend this under some kind of version macro. I'm happy =
to provide a new revision of code.</div><div><br /></div><div>[1]https://pa=
tchwork.kernel.org/project/linux-pci/patch/1688059190-4225-5-git-send-email=
-lizhi.hou@amd.com/</div><div>[2]https://github.com/siemens/jailhouse/pull/=
31</div><div><br /></div><div>By the way, if anyone else is also on the sam=
e page integrating with mainline kernel, I've done some patch [3] that is e=
xactly done as the official jailhouse-enabling done here[4] (with minor twe=
aking so it consume latest in-kernel API).<br /></div><div>[3]https://githu=
b.com/cnnblike/rk-build/tree/v23.11/userpatches/kernel/rockchip64-edge</div=
><div>[4]https://github.com/siemens/linux/tree/jailhouse-enabling/5.15</div=
><div>KL<br /></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/98597217-94d8-484d-a8cc-d6be44452dd4n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/98597217-94d8-484d-a8cc-d6be44452dd4n%40googlegroups.co=
m</a>.<br />

------=_Part_28096_1069759686.1716043184498--

------=_Part_28095_691379949.1716043184498--
