Return-Path: <jailhouse-dev+bncBCDKHIWT5EIBBEGKVGOQMGQEF3TDZNA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113a.google.com (mail-yw1-x113a.google.com [IPv6:2607:f8b0:4864:20::113a])
	by mail.lfdr.de (Postfix) with ESMTPS id A091A65671C
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Dec 2022 04:22:58 +0100 (CET)
Received: by mail-yw1-x113a.google.com with SMTP id 00721157ae682-47e231f5a18sf27195117b3.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Dec 2022 19:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8bZdLIw/ktrz7dK1wr2kG4zMC7cJpCEuncKqVD4lp2k=;
        b=Zfxcyjv/52B9KHUPxz8YXJbkOuxzbPvQ1CVRtMoJpR1uIloQz0fBZJVm4rdDMBm+AB
         RByMUWf9lGbsXrgHYzWcEPItv6chFNEcTAKMkkoh2emT9e1gq1msDX83qH1gTteuBgkK
         k0vZ0VVUDAJfTaeElb6fIShmhf7eBLgNLT8KSIN57ctOEpxzPnFIDL0giALEM4H7fQdy
         2WWPTkxFVkXj/BplzU0Sd/S4L+A0//FVUU5hWPNE8Ib2+hREjoo/IXS27djMVwj7fLxJ
         8oWQ5PZeOQ+DRoDqXlm3Hf6iMCXSmFyMrVFSRBrCmYfG55pu7Ic67sw4tHnfpikTjTvp
         J6RQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8bZdLIw/ktrz7dK1wr2kG4zMC7cJpCEuncKqVD4lp2k=;
        b=YFXVoEsJLO7/L+fiXRBy0uMfP7RJR2zhdRNO6MSHHt33ihy97OLBpFpBLIbW1qdjAE
         7VCQIEjgJ76/QlCm0519srw5cMVQKIXSv0B3GGVFRY6ckwJLryeqqGK5cv4gYLZGjonS
         dEX/wa/1GNDKo25ty8m85g7TJC4j/RGbJBxruQG64zRHHFv3wCGE6yiU+bhxz1yByuUc
         2PsGpLEIBHyRVMSX7e7VVyUeyC3Uar0IhnZizlvKQLxPFKG2PUow/EUkJ0NA6BrV7zfu
         r6JhaQoCFe8zCdVCnRkgY0TO3Sk0eJOrorP479Mkz7QHbiLy1fcn5h1DdhDrL7Y5NP0s
         ytWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8bZdLIw/ktrz7dK1wr2kG4zMC7cJpCEuncKqVD4lp2k=;
        b=XF82MWx1JSGvMGsv/52odotUsTm+M0Kmg/GvPACzAWe5NMGB9TBvRzilhxKWHZuzw7
         tulXiJfZrpKu1oOV7ftLvPPecG1z2Fg3Qkf7II8PnZS1DTcfZ3GOKSHFtLaDuXVlezKi
         QEASEtzS2wX24Znzm10QMiT2WUAA7TIIpx3AOr9Y3Fqku3bni3yoJTCMgu9XYsx58M8A
         ei81YbI6k1Glw+eTiPm/5/iSy9/CTDoWtYhGwwHdn6W9KOOgfMPznb93PkVgWFjDOUA/
         stGbYIFGFRGz9rSPkzcdeVNhzu2exUiWY086fnlejGzJAPw4Td4cXzecyCINVZG/o10y
         yrvg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2krN3JDM35L5GfMz5LfRZEozsx/sCanhBXGqYFW7XXu7VzV9PdIP
	QO1nvHhQiOK3J/PjrQ5oS0Q=
X-Google-Smtp-Source: AMrXdXvZwzHd+Cz8D6jjMzs3whr5GnG0KufWTyt3UT2/xCvHLoi00QicakHq8cYWWU9mSZhwCL9ukw==
X-Received: by 2002:a25:508b:0:b0:6f8:d996:874b with SMTP id e133-20020a25508b000000b006f8d996874bmr1375145ybb.562.1672111377163;
        Mon, 26 Dec 2022 19:22:57 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:690c:fc9:b0:36a:2cc6:5e7e with SMTP id
 dg9-20020a05690c0fc900b0036a2cc65e7els3289336ywb.7.-pod-prod-gmail; Mon, 26
 Dec 2022 19:22:56 -0800 (PST)
X-Received: by 2002:a05:690c:29b:b0:3ea:454d:d1ee with SMTP id bf27-20020a05690c029b00b003ea454dd1eemr1815265ywb.27.1672111376193;
        Mon, 26 Dec 2022 19:22:56 -0800 (PST)
Date: Mon, 26 Dec 2022 19:22:55 -0800 (PST)
From: =?UTF-8?B?5byg5a626ZOt?= <j.jyaming@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <71033b4d-67fd-4aad-9605-cb4c01b2c01an@googlegroups.com>
Subject: Help: About jailhouse cell stats XXX
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2676_985731799.1672111375619"
X-Original-Sender: j.jyaming@gmail.com
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

------=_Part_2676_985731799.1672111375619
Content-Type: multipart/alternative; 
	boundary="----=_Part_2677_2108514633.1672111375619"

------=_Part_2677_2108514633.1672111375619
Content-Type: text/plain; charset="UTF-8"

Hi,

When I used command `jailhouse cell stats XXX` to evaluate jailhouse cells, 
I ran into a problem. Does this command provide additional options to 
output the result to a file? If not, how could I do to get the file to 
show/record result?

Thanks,
Jiaming

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/71033b4d-67fd-4aad-9605-cb4c01b2c01an%40googlegroups.com.

------=_Part_2677_2108514633.1672111375619
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<div><br></div><div>When I used command `jailhouse cell stats XXX` to ev=
aluate jailhouse cells, I ran into a problem. Does this command provide add=
itional options to output the result to a file? If not, how could I do to g=
et the file to show/record result?</div><div><br></div><div>Thanks,</div><d=
iv>Jiaming</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/71033b4d-67fd-4aad-9605-cb4c01b2c01an%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/71033b4d-67fd-4aad-9605-cb4c01b2c01an%40googlegroups.co=
m</a>.<br />

------=_Part_2677_2108514633.1672111375619--

------=_Part_2676_985731799.1672111375619--
