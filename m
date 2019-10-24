Return-Path: <jailhouse-dev+bncBC2PTC4R4MNBBA54YXWQKGQEC2AHMYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23f.google.com (mail-oi1-x23f.google.com [IPv6:2607:f8b0:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A36E2BE6
	for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Oct 2019 10:17:09 +0200 (CEST)
Received: by mail-oi1-x23f.google.com with SMTP id d66sf13801485oib.11
        for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Oct 2019 01:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5Xl45novqC75txgPCOiSfhd4/97u1YqMvvSzHICpJAY=;
        b=BSuBcBsElgIKEcZYglJD1ubaTvc78GESz20RKnYr0IOxmG6Wo+z60jSvd7CBUW81Sa
         fUqruSbNJQNcXKxo2+RZklPCUPj/6QFhDSDykx5YQyw//YNOa6LP4fr7aC4Oqrww1CQ1
         vceafUuHaKh/3DW/oEpY1NUUQYWeeLeDxRqizy/WUWcKGzdAbMlzCJqbk0oTYKS+ZSOz
         MI3id9zsgEud4RIfdD9CAGvEg5znFpjj+plV2cqEog47LCkmktRIn+wLnGztiGCl82gp
         oiR9WMS53jJML+M0Z9b5JfB/mN4YeR+4rMYLBrcLmhn8b29w7mKzAygRgXXTHA/l2cZX
         dclA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5Xl45novqC75txgPCOiSfhd4/97u1YqMvvSzHICpJAY=;
        b=MaHAyXR747gUDl+J2F0iatkqRqYZJxO0KD1QydkT9Bfby5L1zWvcK1DEagz9E5ZIvt
         Zfkv4jfvaalVJLJwfbUckVGRJUdBvcLWQoFcMm7xeRo1bKLSA5Mg8Ki7Vv7qmzp3SxDx
         Ek6P6FYUdUIEZtT1YLHU2Bgs684wl0BtC4fiXuPHJQYaya4XY/4NS1q6L5mMdb0oSXPe
         ttK4nTNWUwIs1v1OPtkbBnQhbsB/2S64vh/BaUTRdbAEYmycRpBREHgPVwjfSRkqTIG4
         igZlqkK/QsYLnppCxB21JTGVki2azvld8vbxzrSGM+eJX/1qVHI2rOQyYiWtl6IH6hQu
         hmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5Xl45novqC75txgPCOiSfhd4/97u1YqMvvSzHICpJAY=;
        b=sZ6ByZTNn1oEKjHcxZ//0N0wKe2J51JtjSiDkf1gK3OduJnk22M1aq4Xns6gEdMJJV
         ZrwRdpr0m3Z5P59JuB6SwjACX8ClqwdYU0FpswF7BKULiPAvTrfI7edvtvKo/a+bD2/a
         eOlt6IACQflBTQoKwGzj0JF9qIuon+IzqctnJdPTRA3ZqisxoPedBG3b0orn3yFM0AhN
         EB4CXPRhE2FMyYpEpG1xOQPRYtg7q2dgzukaww5dBMpESW54n5O3ArR2aETwF8Tp3kX/
         5C+lTiecXCxkaQNDyna9wDFfOeeXgKr7CLyJby9MXFXTluXXxLm13K/jSJsBzHTl9R8g
         tu/A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVeSaIenJtsWNZKff+adf0DvrYaIw/RDZor5PFe4HprTYDn3LIE
	VHilJGfU5vBxqA+X5/F3rc4=
X-Google-Smtp-Source: APXvYqwpLi9ZHu8jJ+2JX6CxUdMHElo3oalq9LLU/x22QyT+q3Cj5OlWNG5DZbFVdu8cCDcaBw8GIw==
X-Received: by 2002:a9d:664:: with SMTP id 91mr10406880otn.189.1571905028030;
        Thu, 24 Oct 2019 01:17:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:5886:: with SMTP id m128ls1359421oib.14.gmail; Thu, 24
 Oct 2019 01:17:07 -0700 (PDT)
X-Received: by 2002:aca:650a:: with SMTP id m10mr3594649oim.130.1571905027200;
        Thu, 24 Oct 2019 01:17:07 -0700 (PDT)
Date: Thu, 24 Oct 2019 01:17:06 -0700 (PDT)
From: Chung-Fan Yang <sonic.tw.tp@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <a54a651c-13de-4aa1-9c32-475ebddc4e6f@googlegroups.com>
Subject: v0.9 vs v1.1 interrupt latency raise
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3328_1897195641.1571905026396"
X-Original-Sender: Sonic.tw.tp@gmail.com
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

------=_Part_3328_1897195641.1571905026396
Content-Type: multipart/alternative; 
	boundary="----=_Part_3329_1904711175.1571905026396"

------=_Part_3329_1904711175.1571905026396
Content-Type: text/plain; charset="UTF-8"

Hello,

I observed that the interrupt latency raise from 20us to 50us (measures in 
an RTOS) after I upgraded from v0.9 to v1.1.

I am working on x86_64, so I am suspecting CPU bug mitigations. 
I would like to ask that are there any CPU bugs mitigations in effect?

However, I do find out that in Root Linux, the latency is almost the same, 
comparing the 2 versions.

Are there any thing I should adjust my RTOS to adapt with?

Does anyone has ideas of the source of such difference?
Comments are welcome.

Yang

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a54a651c-13de-4aa1-9c32-475ebddc4e6f%40googlegroups.com.

------=_Part_3329_1904711175.1571905026396
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>I observed that the i=
nterrupt latency raise from 20us to 50us (measures in an RTOS) after I upgr=
aded from v0.9 to v1.1.</div><div><br></div><div>I am working on x86_64, so=
 I am suspecting CPU bug mitigations. <br></div><div>I would like to ask th=
at are there any CPU bugs mitigations in effect?</div><div><br></div><div>H=
owever, I do find out that in Root Linux, the latency is almost the same, c=
omparing the 2 versions.</div><div><br></div><div>Are there any thing I sho=
uld adjust my RTOS to adapt with?<br></div><div><br></div><div>Does anyone =
has ideas of the source of such difference?</div><div>Comments are welcome.=
</div><div><br></div><div>Yang<br></div><div><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/a54a651c-13de-4aa1-9c32-475ebddc4e6f%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/a54a651c-13de-4aa1-9c32-475ebddc4e6f%40googlegroups.com<=
/a>.<br />

------=_Part_3329_1904711175.1571905026396--

------=_Part_3328_1897195641.1571905026396--
