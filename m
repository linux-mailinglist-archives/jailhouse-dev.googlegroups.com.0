Return-Path: <jailhouse-dev+bncBC3I7HXHR4OBB64X5P7QKGQECI6YDZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x137.google.com (mail-il1-x137.google.com [IPv6:2607:f8b0:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 270F02F0632
	for <lists+jailhouse-dev@lfdr.de>; Sun, 10 Jan 2021 10:42:21 +0100 (CET)
Received: by mail-il1-x137.google.com with SMTP id f19sf14687126ilk.8
        for <lists+jailhouse-dev@lfdr.de>; Sun, 10 Jan 2021 01:42:21 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1610271740; cv=pass;
        d=google.com; s=arc-20160816;
        b=nsztreAJhX2aMrxWCWtb60gJ8rsep6LxSfeDkLfZqKT1vqWZRVsK9LxylRkkC+c+MY
         JelEHtz5fEvKCi574yjbnX/YJu8ABtexYOvaPJSu00t5y39PvnepiS9ssOi/xoWn+rb3
         AQfJNv+exlfuQyiUrLn7Ij5pIsUOKgSdu4Xljv4lnwIdGtDmVi+cDLDw2fb8IKsSkdmB
         00jsR9lXA1Yl43sOl+Y1pODv604Qo1oUEZdmr+SiRNUtZvoW7HCeSBM3MkroJUPeTNsM
         Yj+Hl7vtkqoafpFYSWpmNn42iFr7b9SHNjfVMwNckyH+vFIua57l1HvqAHhx8LGE1Si8
         sZaA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=f6YxShXCq+AIVeQXQDsQEqd22rz8vhxl2iYcGPr6OFM=;
        b=qW7qLTkoBG5QBhuDC88MYOQtr3K13OVUL0ytmYOLeUsvGTY7F13aPZ+RhHhutMwwiq
         mzigwraPg58Ejamrdef6VTEsSlCfhmLjknWYQx0+bh++at2KXLLWpZ4gS+wJki6Fb9aC
         HA6iTSBrzoKpvNpIHZfpjQNV+JqxAjCcN3KnvYROSc9d/xS7Bs3PLh2D/cKF5LQtQpMT
         lDLMkC/aLItH/iXPyg9iiH5F8z/LgHoq8+RQ+gs39mMNaeuD6/LkzXQWVVl8z8hfi3cy
         ThOxMk6DRmd/rKUmTN/uNVU1jZb56tZJoiAOKz237WkqVNEKeqVVz7ZOiqjg3Gs8wm1/
         1gQw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=QhBgvQxz;
       spf=pass (google.com: domain of richidubey@gmail.com designates 2607:f8b0:4864:20::d34 as permitted sender) smtp.mailfrom=richidubey@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=f6YxShXCq+AIVeQXQDsQEqd22rz8vhxl2iYcGPr6OFM=;
        b=f4SAe+vaaZIdG5nn9rekr4nCkZDeTW7ry8J/htM5+66f0Sslh6vuS8+BTJA1tblh84
         JYJHu1p2MUfO1wspKeCAuuuL2GCWqaFYwrCrc22ts44t/7bRMqyuly85fE756WoYJn0Q
         IXGkyt/dnaoTfUc/iXlBxZk3nvjJ7qTy6lhGdy4T/GwBh4B95L8yt7WqcvX9J4XuUcfO
         rcxkH939O2YtRyAPsH5/x8J0DXQ/DgnPWwYckHYKrCbq1bjDcYz+DNRrO4K+UNT6p0fA
         XqPmJfGtHSNb5DmFny01ep7N+0SwFqBVBA8NViem0vSTtSYcCRJEwKshn8eFRiNHb45c
         zTgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=f6YxShXCq+AIVeQXQDsQEqd22rz8vhxl2iYcGPr6OFM=;
        b=BcwSJzYcEOVBd2mmCDEueHmhnG5oEQ+8RYibzgNqgeYc1lmGTw+BKzAKii/YyimiHy
         /06Rvaus2MRpFgnliCu+u5uv1INO3LzQ2cH31QbtMlelNFljtNPLPS8wWUqaT0FAac88
         BiVV0NLEyQbcX8XClu/g1u7cvr2GsXJeFP4mSM8G0QMF+VSpheUK/egDbymwMuqr44WL
         Fa02U07NeGSgYmVVU5R8z8wFNUaQqloRtJsANDLFC046P2CSCc7/JNKtBkwNdu9HwsWI
         SAxOyzAUdRyRSEF1ihBz0kZ5WHjSXFGnNSBJnjqe+cB8aX42JKtLUx4rJ0IMrHa5snWU
         Q2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=f6YxShXCq+AIVeQXQDsQEqd22rz8vhxl2iYcGPr6OFM=;
        b=rKpRGLnTDh8AXeiEm5HySNvdfrBBlWp6tGqoyxDCkYiQVB5bNmhdjsHQCffDqP6UGK
         lSAP33ulqSSw1krgIUt6EjpRWUjEogWMZnHBH9OqVC4JGFY/iwYAjM9V4gad3aw4NXlI
         rZB4EaBl+KZBOYBE1D7LJFiCgNCRs3bSx+GaT947Ik3T4WplWNlld1SNnP+hJ4kn4Xma
         25PpGU1RrjFJJ3yGrG9HXet3IETD0J0NKFGyv3zdkviD+1qHseewfqTiTQXsX3pqyUk1
         jhRMsw7DP/ucgxXAffCul5/Xx6T9Q8kDWrJrtCW13VyWQiLzpLvszUGphJJyYBL5v/fC
         oVrw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5320f0zDqpzTZ84PnaInVoku/Y98qVLMZVcUIbFeDOcgGaNpA0iP
	Nx09bGNuR//fMQhMEGA9L/Q=
X-Google-Smtp-Source: ABdhPJxq4b7OXecI8uhCZjeh+Otf0Pck9iYLqVgJyB11jF+LbfBcjwJAhHaf7LUPhtyz+RYB9ju4+Q==
X-Received: by 2002:a92:dc4a:: with SMTP id x10mr11388946ilq.153.1610271739853;
        Sun, 10 Jan 2021 01:42:19 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6e02:1c0d:: with SMTP id l13ls3138296ilh.7.gmail; Sun,
 10 Jan 2021 01:42:19 -0800 (PST)
X-Received: by 2002:a92:d152:: with SMTP id t18mr11151014ilg.76.1610271739393;
        Sun, 10 Jan 2021 01:42:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610271739; cv=none;
        d=google.com; s=arc-20160816;
        b=dM576LPuOOm/mO6YUL9Nkh8lAoV/yD49DFK1xjYbrBpFJ2+0U/8k7s/hIXh2P5b6JD
         uaD+gpWPyfenkk5ijJfTx7GjRbcviOcnNVPnX28att2AZsfcI7q3RX7KHnHlZTQV6UMm
         2f7zd4i+dEICoaRFKU1Dtvsk7nuwoOvTG4SrF4m5mEZzVCPBWFvmNn5k6bML+YH1IYMc
         Naxt+uZNqaF5X2FFWcEpY7Izabq6GK+XG/WIaI+5AHBKB8Wvx+OmLMp2JgSBgQ+/nzSq
         SJgvtyqFmWv5fH7XfaTnzUGCZFcRmKOYs5oDFWnj13N1wLd7qy6rmUeJrj1vVu5OVo+m
         R87g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=EPg9wriFUmbyQK3nGLvU/ozVkFilQ+FUFbbz974pGRo=;
        b=kw7+zJs8QbOuDMhS0/jUFS1jYkGTEY06OT2sGzfxSLzvBgDoTzNScPBxcxC17IM9k6
         mFZoVXsT0XxffhczNPnSGbsVA/QGk2gJi3Ug+Hs6Gdy9iAMoJ4koJkwVPwmQP0a13SAT
         Xvn8oIoxXvVM5x4CdQxbchvRQLPLsRjdgScxv+JlVgjLOPABEd0ZyYZ5C8r5AxteBGg5
         K1RvdFLNESrCaH27j8a+6spgZnYsOZ/qnmDZf7ct9f/Q5O+lzdNnUvpdlt4lwbWtIbmZ
         CW/jvCTbfiqs6vGly8lPTnaH5Ru0wS332O65/pc25NHvl+OPNgegLZ5Bk3jRG/8r0yLF
         PPlA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=QhBgvQxz;
       spf=pass (google.com: domain of richidubey@gmail.com designates 2607:f8b0:4864:20::d34 as permitted sender) smtp.mailfrom=richidubey@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com. [2607:f8b0:4864:20::d34])
        by gmr-mx.google.com with ESMTPS id y16si329370iln.0.2021.01.10.01.42.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Jan 2021 01:42:19 -0800 (PST)
Received-SPF: pass (google.com: domain of richidubey@gmail.com designates 2607:f8b0:4864:20::d34 as permitted sender) client-ip=2607:f8b0:4864:20::d34;
Received: by mail-io1-xd34.google.com with SMTP id n4so14557508iow.12
        for <jailhouse-dev@googlegroups.com>; Sun, 10 Jan 2021 01:42:19 -0800 (PST)
X-Received: by 2002:a5e:970d:: with SMTP id w13mr11369767ioj.166.1610271738898;
 Sun, 10 Jan 2021 01:42:18 -0800 (PST)
MIME-Version: 1.0
From: Richi Dubey <richidubey@gmail.com>
Date: Sun, 10 Jan 2021 15:11:53 +0530
Message-ID: <CAAQOZwwfhYMoBMnqk1v4THup3t6kxA+V0tgWS7xqduuGb6ZxPA@mail.gmail.com>
Subject: Error when testing linux on jailhouse
To: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="000000000000fd309605b8889ae4"
X-Original-Sender: RICHIDUBEY@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=QhBgvQxz;       spf=pass
 (google.com: domain of richidubey@gmail.com designates 2607:f8b0:4864:20::d34
 as permitted sender) smtp.mailfrom=richidubey@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--000000000000fd309605b8889ae4
Content-Type: text/plain; charset="UTF-8"

Hi,

I am new to Jailhouse and am trying to test linux on jailhouse on a Zynq
UltraScale+ MPSoC ZCU102 board. I have copied the Image and the rootfs
file, but when I try to run the command:

 jailhouse cell linux zynqmp-zcu102-linux-demo.cell abc/Image -d
dts/inmate-zynqmp.dtb -i abc/rootfs.cpio -c "console=ttyPS0,115200"

I get the following error:

[  536.015073] CPU2: shutdown

[  536.017777] psci: CPU2 killed.

[  536.034988] CPU3: shutdown

[  536.037680] psci: CPU3 killed.

Adding virtual PCI device 00:01.0 to cell "ZynqMP-linux-demo"

Shared memory connection established, peer cells:

 "ZynqMP-ZCU102"

Adding virtual PCI device 00:03.0 to cell "ZynqMP-linux-demo"

Created cell "ZynqMP-linux-demo"

Page pool usage after cell creation: mem 82/994, remap 5/131072

[  536.066780] Created Jailhouse cell "ZynqMP-linux-demo"

Cell "ZynqMP-linux-demo" can be loaded

Traceback (most recent call last):

  File "/usr/share/jailhouse/tools//jailhouse-cell-linux", line 857, in
<module>
    cell.load(args.initrd.read(), arch.ramdisk_address())

  File "/usr/lib/python3.7/site-packages/pyjailhouse/cell.py", line 44, in
load
    fcntl.ioctl(self.dev, self.JAILHOUSE_CELL_LOAD, load)

OSError: [Errno 22] Invalid argument



Can someone please help me with this? I saw that someone else also had this
error:
https://www.mail-archive.com/jailhouse-dev@googlegroups.com/msg07264.html,
but I have not modified any memory addresses.

Thanks,
Richi.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAAQOZwwfhYMoBMnqk1v4THup3t6kxA%2BV0tgWS7xqduuGb6ZxPA%40mail.gmail.com.

--000000000000fd309605b8889ae4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I am new to Jailhouse and am trying=
 to test linux on jailhouse on a Zynq UltraScale+ MPSoC ZCU102 board. I hav=
e copied the Image and the rootfs file, but when I try to run the command:<=
/div><div><br></div><div>=C2=A0jailhouse cell linux zynqmp-zcu102-linux-dem=
o.cell abc/Image -d dts/inmate-zynqmp.dtb -i abc/rootfs.cpio -c &quot;conso=
le=3DttyPS0,115200&quot;=C2=A0<br></div><div><br></div><div>I get the follo=
wing error:</div><div><br></div><div>[ =C2=A0536.015073] CPU2: shutdown =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <br>[ =C2=A0536.017777] psci: CPU2 killed. =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 <br>[ =C2=A0536.034988] CPU3: shutdown =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <=
br>[ =C2=A0536.037680] psci: CPU3 killed. =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>Adding virtual =
PCI device 00:01.0 to cell &quot;ZynqMP-linux-demo&quot; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>Shared memory connection =
established, peer cells: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>=C2=A0&quot;Zyn=
qMP-ZCU102&quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0<br>Adding virtual PCI device 00:03.0 to cell &quot;Zyn=
qMP-linux-demo&quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 <br>Created cell &quot;ZynqMP-linux-demo&quot; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0<br>Page pool usage after cell creation: mem 82/994, remap 5/131072 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>[ =C2=A0536.066780=
] Created Jailhouse cell &quot;ZynqMP-linux-demo&quot; =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>Cell &quot;Zyn=
qMP-linux-demo&quot; can be loaded =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>Traceback (most recent call last): =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0<br>=C2=A0 File &quot;/usr/share/jailhouse/tools//jailhouse-ce=
ll-linux&quot;, line 857, in &lt;module&gt;<br>=C2=A0 =C2=A0 cell.load(args=
.initrd.read(), arch.ramdisk_address()) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>=C2=A0 File &quot;/usr/lib/py=
thon3.7/site-packages/pyjailhouse/cell.py&quot;, line 44, in load <br>=C2=
=A0 =C2=A0 fcntl.ioctl(<a href=3D"http://self.dev">self.dev</a>, self.JAILH=
OUSE_CELL_LOAD, load) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <br>OSError: [Errno 22] Invalid argument=C2=A0 =C2=
=A0 =C2=A0=C2=A0<br></div><div><br></div><div><br></div><div><br></div><div=
>Can someone please help me with this? I saw that someone else also had thi=
s error:=C2=A0<a href=3D"https://www.mail-archive.com/jailhouse-dev@googleg=
roups.com/msg07264.html">https://www.mail-archive.com/jailhouse-dev@googleg=
roups.com/msg07264.html</a>, but I have not modified any memory addresses.<=
/div><div><br></div><div>Thanks,</div><div>Richi.</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAAQOZwwfhYMoBMnqk1v4THup3t6kxA%2BV0tgWS7xqduuGb6Z=
xPA%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAAQOZwwfhYMoBMnqk1v4THup3t6kxA%2BV0tgWS7=
xqduuGb6ZxPA%40mail.gmail.com</a>.<br />

--000000000000fd309605b8889ae4--
