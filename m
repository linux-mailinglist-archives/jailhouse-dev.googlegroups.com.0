Return-Path: <jailhouse-dev+bncBC5J3D7HTQNBBEX3WPVQKGQEVFFVYHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x340.google.com (mail-ot1-x340.google.com [IPv6:2607:f8b0:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FB3A54DD
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 Sep 2019 13:31:31 +0200 (CEST)
Received: by mail-ot1-x340.google.com with SMTP id w60sf253613otb.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 Sep 2019 04:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=X6btMh+QJaY96UUVsHTegvAtTo/eMpwxed93KbBiiUs=;
        b=e6NeGfb6FI+4I9VxlE49oe/p3PqXMzIUDGz9pMmbgxL0GAJTWSZFO6TElEIVxsphiO
         k+GPXpy2kzy3ogP83iq7FDcqWcgmBx+2AMi7kuB22p5ne+l0C+v23gz+buQId99AfZbb
         2IeBmmuDXWMA5alNn7sHzWaen+tpdM2FJhur1wwweqYBchRuet1XVMwKjpHOoBDdozMI
         /Lvu2nxajX+CzftzmaAJp9dbfzDPbXPen/Wt17SA5Zwxfq039TAQ5qLozoyWjdrERumb
         hkMuyaYcuK2Yf7lPi0N0Aeyi+PEJ7VHuaT1ky3emqh+NkU/mySsMcNYLo/4EBUQqJgYz
         5Ixw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=X6btMh+QJaY96UUVsHTegvAtTo/eMpwxed93KbBiiUs=;
        b=KE4C1KjGEVZ0TfZBmo3Wq9l1t+4ci1kSzoXPoSBurJyB6s2rYyAR+Ad9a6+qo26vvY
         nyzii1H/G9r3WBYOnIoRchg11Wy3rXzfi7ziUckWPkBE1bKfWBd7t4JNUXOiKSxqzF/K
         2f6LmvFcFYbjmDK/ZtkQDe6E9wxkZoYnl+UQP1HmWlErP03dQr7nOUdj9V9kX8xot23d
         GxDISgwybDP/GSjPBrfjA5qxdUwERX/VQVsu9jEXLtF0P6Cg71NJHm20j+oCvFDRcSCn
         kx0diRs/MPBlJqKZ1Ysd8j/ZQOBBkS/pQClGXxc6wWGPAbBuxHT2piA7NkuWefUtpsBK
         iwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=X6btMh+QJaY96UUVsHTegvAtTo/eMpwxed93KbBiiUs=;
        b=hlTLxPxlM890rqCzMqkW/P1sk4+6jp21PP7xL9tv8Pr/Zz3DWduz/V3DL3/Fpq0UV8
         qCKjULujLu4ELL2S+q0HICVmPpRec+kn6GVzYA4aidlzcAXkJQjim4LKBj+shox3CYs9
         9JhztusIlqW41BAR4GP0Ol+7HDvE2ahj2Dp4VN5smuIB1SJgUvyavZcmTqRcPpaN8kFS
         ni9Qnoq4i0WUOwR0+OvRzDaQGtwFzjLfomFlApU68UHUg5mHTR3Hrig0TbtgP8iCl9dj
         MnOa5PcyR+YPyuIEEYSt7Zw+iLOc9IcfdMOVmlDZcs+MJpefg1MlJhwyCx2tA78FhIy+
         jPWw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVFjQ2xo0saCTu3CWJFpOhk5napno7XzoQury8JEyvKmayARZBS
	PMPedN3Y0kuhdO0JW8wVgiE=
X-Google-Smtp-Source: APXvYqzLxsvmWiia8f4G6rcSWMCulQhc7V605NPs7+EXKM8Xd56lhiSc5ixsNc3a6xt1vPVLBQXQYg==
X-Received: by 2002:a9d:67cd:: with SMTP id c13mr24522408otn.196.1567423890452;
        Mon, 02 Sep 2019 04:31:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:ad92:: with SMTP id w140ls221649oie.2.gmail; Mon, 02 Sep
 2019 04:31:30 -0700 (PDT)
X-Received: by 2002:aca:c50a:: with SMTP id v10mr2555796oif.174.1567423889654;
        Mon, 02 Sep 2019 04:31:29 -0700 (PDT)
Date: Mon, 2 Sep 2019 04:31:28 -0700 (PDT)
From: Nir Geller <nirgeller18@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <361d6548-e251-4e1e-a03b-cdcbfda1b67d@googlegroups.com>
Subject: Interrupt Latency in RTOS inmate cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_465_210077495.1567423888955"
X-Original-Sender: nirgeller18@gmail.com
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

------=_Part_465_210077495.1567423888955
Content-Type: multipart/alternative; 
	boundary="----=_Part_466_416790309.1567423888956"

------=_Part_466_416790309.1567423888956
Content-Type: text/plain; charset="UTF-8"

Hi there,

I'm using Jailhouse 0.7 on a AM5728 based custom board, on which I'm 
running Linux on A15 core0 and TI-RTOS on A15 core1.
Linux kernel is 4.14.79 with RT-PREEMPT patch, supplied by TI.

On the TI-RTOS side I have an interrupt driven by a togglled GPIO at duty 
cycle of 31.25 usec, and I'm experiencing jitter of up to 40 usec.
This happens when both Linux and RTOS are not under any load.

When running the TI-RTOS natively on A15 core0 the jitter is stable and 
doesn't get higher than 12 usec, which is acceptable.

Also, I started the hypervisor and the TI-RTOS app, then I made the 
hypervisor park core0 by attempting to read a memory address that Linux is 
not allowed to access
and again on core1 the jitter is stable and doesn't get higher than 12 usec.

I guess that Linux is causing the interference.

Does Linux postpone/disable interrupts on core 1? Can it be avoided?
What else might cause the jitter?

Does it make sense to port Jailhouse to a newer version?

Thanks,

Nir.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/361d6548-e251-4e1e-a03b-cdcbfda1b67d%40googlegroups.com.

------=_Part_466_416790309.1567423888956
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi there,</div><div><br></div><div>I&#39;m using Jail=
house 0.7 on a AM5728 based custom board, on which I&#39;m running Linux on=
 A15 core0 and TI-RTOS on A15 core1.</div><div>Linux kernel is 4.14.79 with=
 RT-PREEMPT patch, supplied by TI.</div><div><br></div><div>On the TI-RTOS =
side I have an interrupt driven by a togglled GPIO at duty cycle of 31.25 u=
sec, and I&#39;m experiencing jitter of up to 40 usec.</div><div>This happe=
ns when both Linux and RTOS are not under any load.</div><div><br></div><di=
v>When running the TI-RTOS natively on A15 core0 the jitter is stable and d=
oesn&#39;t get higher than 12 usec, which is acceptable.</div><div><br></di=
v><div>Also, I started the hypervisor and the TI-RTOS app, then I made the =
hypervisor park core0 by attempting to read a memory address that Linux is =
not allowed to access</div><div>and again on core1 the jitter is stable and=
 doesn&#39;t get higher than 12 usec.</div><div><br></div><div>I guess that=
 Linux is causing the interference.</div><div><br></div><div>Does Linux pos=
tpone/disable interrupts on core 1? Can it be avoided?</div><div>What else =
might cause the jitter?</div><div><br></div><div>Does it make sense to port=
 Jailhouse to a newer version?</div><div><br></div><div>Thanks,</div><div><=
br></div><div>Nir.</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/361d6548-e251-4e1e-a03b-cdcbfda1b67d%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/361d6548-e251-4e1e-a03b-cdcbfda1b67d%40googlegroups.com<=
/a>.<br />

------=_Part_466_416790309.1567423888956--

------=_Part_465_210077495.1567423888955--
