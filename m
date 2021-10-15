Return-Path: <jailhouse-dev+bncBC64DZNZYEERBJXGUWFQMGQEZBIDRKI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83c.google.com (mail-qt1-x83c.google.com [IPv6:2607:f8b0:4864:20::83c])
	by mail.lfdr.de (Postfix) with ESMTPS id 390A042F0B3
	for <lists+jailhouse-dev@lfdr.de>; Fri, 15 Oct 2021 14:25:12 +0200 (CEST)
Received: by mail-qt1-x83c.google.com with SMTP id d21-20020ac800d5000000b002a7ae3ec644sf983404qtg.7
        for <lists+jailhouse-dev@lfdr.de>; Fri, 15 Oct 2021 05:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=upZzidaLIH5fAbxtxccp7A0KkSzt2aQIEelLU8C/wG4=;
        b=GkRwJMdEOIDTglhfHLVq69NQ6unCek500boXR1+bKAH2t2hz0VOvZJJ1Um4JZ4NjBc
         tXuTXmFynd4ZAipiTvzzhT/MeWHjJXSPJ3UQBFIxfiRbpLXf6jY6eIQlX+KI1TAiYVYC
         wlK+LPU31DIV8GsPSI0vryIahTZuqdXIlv8P3BLjb8Pp+VSW2gyxySIw1Xqee9wnE8gB
         YyL1d474u+CSdU2x/3uwJT74vyEECRwqGXFU/CCzL3B0Moo7yM8YG46aLbrhRBpb7Ybq
         mapiHufeMFnnZ1YsGqvkY8bsoFNEpwqCx/1AQk01AgikUHSRsQHlWTIvrOyUQT/CUrdU
         iUNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=upZzidaLIH5fAbxtxccp7A0KkSzt2aQIEelLU8C/wG4=;
        b=qY4AWTUbl/NV4lt/x71Ytm58CxaHKHZGX/er5qNEJ1CAysoKoVCqNY7Wanoo4ZSctF
         nl5xmGd5P9EmLWST0skemJT/279fsn2xqEe/gR1xkonOWP8WpGaTQO043ypEKK0km6Au
         IHFHkPZAsrZ8brcsH4G3WEBzPoeCo+Dciu3Vtan00laS67wnckR1rp45UZf09VMCP0YA
         ToNtMxzLeGPDB2qR1ndYGK//xmmllqzzSlPH5PuYtMm6f90y8Dj0t6IygG26Pif3DJKg
         sv1BBrP3itRw2snBsKqLjuQeziZPSWW4Hzq95kiH1Q4ql2wXShzF8U+1PglBmfQItdxY
         4CLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=upZzidaLIH5fAbxtxccp7A0KkSzt2aQIEelLU8C/wG4=;
        b=a4w/sTM6TttQAsLq6ghLkyj9dIaVZatEBeeChrjDufUXsIuCZ34zVYgcms0VBokdH8
         IL7sY1OYFUTdVuSogQodmNrgfIh2mLmtsSWC6MLHR2AYjR3PAxUJr6BC8CsyuPtoGi/3
         USzLv+Fwbg1a9ad0NNVuO6KxQGdi1nQSJZl6uB6Xo+AvBWONvfLpB/LXpEzzBMDRFg3S
         6pu7mAKOiG+kaEFvJa0jN9PT7Xehxs6yXzsuvJNA22ji7L5cBeIsAL+9QXTvute4VXpK
         wZq7xjthbKpf0CsgDpDm/YP9Cw+lYPaYC/5OhrpUBy/ZzVKlg+8mWAiyX7qwR7pYL5ZN
         ml5g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5320Kegl/5aSemfu9nNeX2GQULRdkfVSOrzVY2piO85OcPkcHSQo
	pHklAnW9JZVcZOkAde+zJBU=
X-Google-Smtp-Source: ABdhPJzd3yyIvTDlt5CR5JEcpKODHKFyqumVaTaUSmcwMbxmraftWSYClhi/gsKhW0C3xriOmIv6sQ==
X-Received: by 2002:a0c:8cc5:: with SMTP id q5mr10835404qvb.52.1634300710993;
        Fri, 15 Oct 2021 05:25:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ae9:ef45:: with SMTP id d66ls4610703qkg.5.gmail; Fri, 15 Oct
 2021 05:25:10 -0700 (PDT)
X-Received: by 2002:a05:620a:49d:: with SMTP id 29mr9504415qkr.499.1634300710315;
        Fri, 15 Oct 2021 05:25:10 -0700 (PDT)
Date: Fri, 15 Oct 2021 05:25:09 -0700 (PDT)
From: Changming Huang <huangcm.huang@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <b4ba42c6-b69b-44c2-895a-944fc30237c0n@googlegroups.com>
Subject: how to enable real PCIe device with MSI-X on arm64 platform in
 jailhouse none-root cell?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2604_729021034.1634300709728"
X-Original-Sender: huangcm.huang@gmail.com
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

------=_Part_2604_729021034.1634300709728
Content-Type: multipart/alternative; 
	boundary="----=_Part_2605_685954951.1634300709728"

------=_Part_2605_685954951.1634300709728
Content-Type: text/plain; charset="UTF-8"

hi, guys,
I have  Arm64 platform (GIC-V3 is used) which integrates one real PCIe 
network device.
This PCIe network device just supports MSI-X, and it works fine in 
root-cell Linux.
I want to enable this PCIe network device in cell (cell runs Linux, too).
I can disable this PCIe device in root-cell by removing its node in DTS 
file.
I added the PCIe network device node into cell DTS (like root-cell DTS)
But I got the error "MSIX alloc failed" during booting cell Linux.
Appreciate for the clue for this issue!

I checked the jailhouse source and document, and I didn't find the 
description about the real PCIe device with MSI-X.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b4ba42c6-b69b-44c2-895a-944fc30237c0n%40googlegroups.com.

------=_Part_2605_685954951.1634300709728
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi, guys,<div>I have&nbsp; Arm64 platform (GIC-V3 is used) which integrates=
 one real PCIe network device.</div><div>This PCIe network device just supp=
orts MSI-X, and it works fine in root-cell Linux.<br></div><div>I want to e=
nable this PCIe network device in cell (cell runs Linux, too).</div><div>I =
can disable this PCIe device in root-cell by removing its node in DTS file.=
</div><div>I added the PCIe network device node into cell DTS (like root-ce=
ll DTS)</div><div>But I got the error "MSIX alloc failed" during booting ce=
ll Linux.</div><div>Appreciate for the clue for this issue!</div><div><br><=
/div><div>I checked the jailhouse source and document, and I didn't find th=
e description about the real PCIe device with MSI-X.</div><div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/b4ba42c6-b69b-44c2-895a-944fc30237c0n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/b4ba42c6-b69b-44c2-895a-944fc30237c0n%40googlegroups.co=
m</a>.<br />

------=_Part_2605_685954951.1634300709728--

------=_Part_2604_729021034.1634300709728--
