Return-Path: <jailhouse-dev+bncBC7PTOEB2ALRBMOT66CAMGQEZB2WFQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf38.google.com (mail-qv1-xf38.google.com [IPv6:2607:f8b0:4864:20::f38])
	by mail.lfdr.de (Postfix) with ESMTPS id A822A380244
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 May 2021 05:08:34 +0200 (CEST)
Received: by mail-qv1-xf38.google.com with SMTP id q15-20020a0cf5cf0000b02901ecb7d57bccsf1647883qvm.17
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 May 2021 20:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WLgCSH8JjT1mD2VX4Jq/hgNKb883B7mBypktXhIU+JA=;
        b=jlsQlFl6wq45zJzkH326+Bm5pA70sVkJNZ8/vXIN5ykMD/oqhqP2V3yf3LZn6xaI8e
         lO37DWTuBChkLaBuKoWSTdH8CLuLhYFDpNxBQWo77nPIDgpACXyaO7+TvyGwWsC1ykha
         Po72St4D1PdaA/1qrWYY7zHQ89b8GWAIlVXGbohXlx0Loxep4fT6QZjqD1qKVGagpQae
         3LIhL4nezu6kXFWvTpOcsmpLqXb5vFusL6xk4yJfbhYt+YuuSEbIVRTs0DOia+JOUgZn
         aROZhIknc5r4SO09zSoJUosN6JbkF3jgdby1mHYHKGLTmfLmhBgMUF8WGLiKqL/CDJ8g
         /qHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WLgCSH8JjT1mD2VX4Jq/hgNKb883B7mBypktXhIU+JA=;
        b=KgVGD7Roc6iDP//9c1KcwxeGs0brM4FeKWgjAzP/wNskzAvtYJtpReIWmEKOA9VUiA
         m/iaP5mSuhKHFi+mEVbedf9z6b5JSRi8lIl8KBTNHTpKBEFaRDx7CfkDhOntiC3bByJe
         hZGpQjuarozkAriScojRbYCeL/KLxVdR3XDHdSYyhpbeAqKpgzkfXnKCuDRkN4BPmDzQ
         FpFDeX9EYphJTcRGLolKGUr1UEcvmz8FGw60RkfdFbotykaboIjVn28a7oMFaqWh12O2
         /1T/ekh/N+/eYWU7Z1TQwmeAUmjOGC3H95CRvtkz8vkKqyLlTHSG0gh/yF4Y76xI5B3G
         sCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WLgCSH8JjT1mD2VX4Jq/hgNKb883B7mBypktXhIU+JA=;
        b=dpX6TIqV8NmdEnDuGWRrwhiTVRoS+FHxdBvQo8r+PGrkuXQVDeDlU6/uMyIHFlXr8X
         XVe1Z+YszDZ8RFjWOPHiLpGcjaQXTeWHEVuqc09Pme71i3bb55fEau7bfhC6MyUha+J6
         45iY1291BX0oyCqWVeRG2GuR7ML9JzJ4oiwpW0T0/tv6wBomxw88kvKr5KgUQ1Su+B9C
         BcSL7JyxDhZxMolgXyNQ/V0OqJPb6WJ7xxkfOg6cj/xidR7ZpTGPSvBRY7GpnlvdL7QL
         XBZl3e+GOfXVVCkpAyLuxSzYRrox+pEwgQgctoHj98+9G2iJtPfq/347ql2IFCJDjXGX
         ybLA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533PZ5U/qsdzu3PWuz0fBXyCnC0qiX6F5DlsmTJ8Luo97Ii/2LLj
	LXj6cUaSRXinWcgxffX/Xr0=
X-Google-Smtp-Source: ABdhPJzzPr31cz8nTWUc86RobeyWGmkPCDRuR94ttOZryySeoCdo6JbG6SRLtw+UE+Pa0lkjXnv7pw==
X-Received: by 2002:a05:620a:12a6:: with SMTP id x6mr40904130qki.364.1620961713570;
        Thu, 13 May 2021 20:08:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ae9:d8c2:: with SMTP id u185ls5129637qkf.5.gmail; Thu, 13
 May 2021 20:08:33 -0700 (PDT)
X-Received: by 2002:a05:620a:103b:: with SMTP id a27mr41142918qkk.228.1620961712901;
        Thu, 13 May 2021 20:08:32 -0700 (PDT)
Date: Thu, 13 May 2021 20:08:32 -0700 (PDT)
From: along li <v6543210@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <09c2642b-ba89-4226-8452-534393dc6a33n@googlegroups.com>
Subject: How to partition PCI devices to none-root cells in rpi4b?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_6100_1960587223.1620961712463"
X-Original-Sender: v6543210@gmail.com
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

------=_Part_6100_1960587223.1620961712463
Content-Type: multipart/alternative; 
	boundary="----=_Part_6101_1479131221.1620961712463"

------=_Part_6101_1479131221.1620961712463
Content-Type: text/plain; charset="UTF-8"

Dear community,

For X86 platform, the  tutorial  pdf talks some about  how to partition pci 
device into none-root cells.     
tutorial:   
https://events.static.linuxfound.org/sites/events/files/slides/ELCE2016-Jailhouse-Tutorial.pdf

But how to do this in arm64 platforms, there is no  document.

Well how to do this, Are there  some configuration demos ?

Thanks.




-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/09c2642b-ba89-4226-8452-534393dc6a33n%40googlegroups.com.

------=_Part_6101_1479131221.1620961712463
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Dear community,</div><div><br></div><div>For X86 platform, the&nbsp; t=
utorial&nbsp; pdf talks some about&nbsp; how to partition pci device into n=
one-root cells.&nbsp; &nbsp; &nbsp;</div><div>tutorial:&nbsp; &nbsp;<a href=
=3D"https://events.static.linuxfound.org/sites/events/files/slides/ELCE2016=
-Jailhouse-Tutorial.pdf">https://events.static.linuxfound.org/sites/events/=
files/slides/ELCE2016-Jailhouse-Tutorial.pdf</a><br></div><div><div><br></d=
iv><div>But how to do this in arm64 platforms, there is no&nbsp; document.<=
/div><div><br></div><div>Well how to do this, Are there&nbsp; some configur=
ation demos ?</div><div><br></div><div>Thanks.</div><div><br></div><div><br=
></div><div><br></div><div><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/09c2642b-ba89-4226-8452-534393dc6a33n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/09c2642b-ba89-4226-8452-534393dc6a33n%40googlegroups.co=
m</a>.<br />

------=_Part_6101_1479131221.1620961712463--

------=_Part_6100_1960587223.1620961712463--
