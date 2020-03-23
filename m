Return-Path: <jailhouse-dev+bncBCFLNWPPWELBBCN24HZQKGQE22QE6JA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EBB18EFFD
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Mar 2020 07:54:01 +0100 (CET)
Received: by mail-ed1-x53c.google.com with SMTP id c2sf10745346edx.16
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Mar 2020 23:54:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1584946441; cv=pass;
        d=google.com; s=arc-20160816;
        b=lDU9L7QVT2v2SZciJxPKFkHuj7QRC1RTIKjil18YEGtFjvQFkpCUup7Dwv5+zP4bGz
         AUN0hXK5rbssJ4rhoM7D0tmipQ1zBkKds3A1zb2sq1O0JaFkOeqe0eb9WV8Wb2kXFXSI
         bad3Q5roT4beW3LUome2d8sdVzFWO5b3S7JyPl8DzrpGXCfYX4i2Uz0RiESyoPwrMGg0
         YRsqDAPQBbwWf7uX9VaCjCJr/ycKnFfAuReZ2eE6kfDKkaaPn1ZCfWJBXl2FSUlsossQ
         P7I8Aqkc+9Pfo8tX88ZvMP+MwSH4OG1C7nPVXaXC+nBmjtPGgSw2ohUjGss6/SWppyPN
         0dwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=XY9JxXDEu3X2Qg7dnJoKxiXbOVpWwxNNBTFdCj9BWAg=;
        b=ufr1wbDNHP3Jeu4ukg8+P1nrNmi4Uom3UiiDk0w5JwEj0dMDyHSlEOwCOuY8xHkKkn
         kDk7ru653n0ZLvCWVPuDq4sjLyXt7cmB1eNxceUPnAc6FH2bYqiPGq2Y5k4gCYxKw5R3
         oQYzDfeLPc2qrfn8SFcaLAc43p3947n7xMRfF1AHVnu6OZK5rkW/Fg+LV+ixrKHyqSQ0
         V65DS7zdMWU7iRBIbe+aMlB72VGY4/Rkd1a9M8+IwzIol83TaGC+VsmiZNI2qQWcTnwZ
         TmMfREBMuGNOXjtJxPngQ+CH4Ku3rcCEnJLWSFZAfgDH8IAaPZc4Rig4wXgIhFIff/EV
         SMiw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=RXaj3rDH;
       spf=pass (google.com: domain of prakharbansal0910@gmail.com designates 2a00:1450:4864:20::52f as permitted sender) smtp.mailfrom=prakharbansal0910@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XY9JxXDEu3X2Qg7dnJoKxiXbOVpWwxNNBTFdCj9BWAg=;
        b=Vy0W/TZuUL3LPyduFFpWuMlwXoC3mYZ7eoTz8ftni2A+qXGGh7tRCxOnRPJ35ofVZh
         waIOxv+c7gzUzzEnJCwsImZfSbXidp9AHvIYibjJzUqYs8/BN+jn1gvH4QZm4n9qO0pH
         zJGbp5tLux1q1lwSPO4xTSPKI8jd3hbxtnOr5165ExWoYxNJqrCJoX581Rw9rxe332k5
         V02D9wQdiJDXwCDsqXZxM3N7rHclDa7/V8YmKVvHGob2+fXyU1vfri9ZEkl1wfXN5fhI
         Bdw4AaYGzlSJmaHttl/omY5ickCfvGvCpriwSUjaWlW9UBj0tdVSXUBbP6GnmKajmc8/
         kpcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=XY9JxXDEu3X2Qg7dnJoKxiXbOVpWwxNNBTFdCj9BWAg=;
        b=cYzUveBEUTt0L/Jls/qCuil+kZwhPbKVF06tVlVvT5nuu4jXY/tmBSrheQwKpTfpLB
         MZXoGLCkH/k/HvqjbLhUO/6f32otjziqc/iM0RSbQOKXX4Xo+usGXl3AkwZf8PQKRIqJ
         fhq6O7kiBIPwiLFf4xMe6M0ddxRcgm6lrJF2ecDOGr1zL/G5WvLoVvbzTjqZWXyJUjTV
         RobkCAhvPnfuppfWNJBnMr9hXdKwWbf43jPN5P0fPlcL5AfBDizXCL83yuR6Vkov7VBe
         vhhjr39nnIEPIgSKrlcaDjlLlE56lDzKMGjnk18IVY2c0RpJUEOrprcAZe3SWaZl335s
         hDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=XY9JxXDEu3X2Qg7dnJoKxiXbOVpWwxNNBTFdCj9BWAg=;
        b=pOpYdwme2Ptotw2cxPo9XvkMNUw7X3nGSKgyvLhrVKm/OuRohxCjkl5WZ2GfWJO2oh
         1OGPlMEeYlKpY8InhIW2MlzoGBXRSkiNMeZ3eXSTWiJLxrObfcg+UxPOcloxSde2CUa1
         K7ilONbkxl5pumPxHe/GNrlyTSig206V+QMuV3dE3C0240hPnsXIHZScsWox+bhv53K/
         yv6JZiyh3eFQ3XX4c18PSN/8N7ejG19ysDf4aDIcI4Lzkj0CdGkNzXQ6+SiW/dDMVYzs
         s2X2q7ZG5D5/7+yNanU6zOw/Q14F96Cr1yQ4m62wuwINay+ET14wyKKPlSkea6qJ4dCS
         MV9w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ1POrkdN5vkOo4Ku7H80axOMq3BeAx1q/x/pCY9lwsxep1CFcle
	OdoAzKZ9BuwmH9tqgO7s1gc=
X-Google-Smtp-Source: ADFU+vtnV2JWNN4yhX0J0oPtb+csqx+MzU6qTEh1JYwOdlTMKBX7IRQbs2nIb8tUgB9lQyfdP1FkOA==
X-Received: by 2002:a17:907:4216:: with SMTP id nc6mr18278538ejb.40.1584946441316;
        Sun, 22 Mar 2020 23:54:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:6bd2:: with SMTP id t18ls2182384ejs.7.gmail; Sun, 22
 Mar 2020 23:54:00 -0700 (PDT)
X-Received: by 2002:a17:906:35d5:: with SMTP id p21mr5625227ejb.281.1584946440682;
        Sun, 22 Mar 2020 23:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584946440; cv=none;
        d=google.com; s=arc-20160816;
        b=dXOknOCj+8sLhj9ksqIOTIjoQ5JeO20FQRfc+sjjI44lMeNtWEykTzHevsKNIIOcKN
         Aqf8M17PZWMX7dV3PYfQRE3pXFiSgNYjR9h/oyFHTd8oAgRohGjyChXrGIktNqpQaVBV
         W5orh8Oaj0Qs4FyUg0HC3NW9mIIQhft/EExjhqORITax8cN2sB5gxByonVq+TO4rjo06
         VqPGrHJIjjubgjJdwE9Q+v2lwYQZvpYlR/DUQUYtVNp6dVxeU5OcDrJb5E0Nj7sbi0Os
         ouyc3M3AkNhUvg0J4GMe1+z1+QX4fazZ6b/jRta/YPnyAFyZEf9DuS0hou2U5WrfX0tj
         IoJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=STV7sRfpkzJUubDv0db7kLeZ8/MB5O6tYXAOnTqgYFg=;
        b=lNtHznJIT7pU346lZM2TSEaH1KyfxMCZuy0RRvqO/A7R+LxMH8/+YEoIMbJZpBpTnq
         V6fzvpSexHOq8Rn7o1prOSeXqijN+tSxXraRSeu1wSHsx/Er6FIQLLSdmpggqzxO2yfi
         eJnPt5CDu1G9eAIdzZ1/LG+vvfaBzpaJfoRXD3t4cmOzOw/LMuHZUv4AJs28HMQbGc73
         XXc/sfSbEkcKW1JvqzNrTOo8oedzw6k+tDldirc+e/xrVGGIHaIK2EI5MZISz1SXXnYD
         IBZHa5KFdQS6GCUy6IhxbUoKGySmi6Ov44sdVZuS/cA3fW0ajfA28snBGYlPVmdAWH4x
         XtTw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=RXaj3rDH;
       spf=pass (google.com: domain of prakharbansal0910@gmail.com designates 2a00:1450:4864:20::52f as permitted sender) smtp.mailfrom=prakharbansal0910@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com. [2a00:1450:4864:20::52f])
        by gmr-mx.google.com with ESMTPS id ck3si618228edb.5.2020.03.22.23.54.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2020 23:54:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of prakharbansal0910@gmail.com designates 2a00:1450:4864:20::52f as permitted sender) client-ip=2a00:1450:4864:20::52f;
Received: by mail-ed1-x52f.google.com with SMTP id w26so8669030edu.7
        for <jailhouse-dev@googlegroups.com>; Sun, 22 Mar 2020 23:54:00 -0700 (PDT)
X-Received: by 2002:a17:906:3443:: with SMTP id d3mr18924635ejb.18.1584946440205;
 Sun, 22 Mar 2020 23:54:00 -0700 (PDT)
MIME-Version: 1.0
From: PRAKHAR BANSAL <prakharbansal0910@gmail.com>
Date: Mon, 23 Mar 2020 01:53:36 -0500
Message-ID: <CAD6ScS9OfG2T3_YBUG8sRMHGVQyFvDwfm_wGtz880yTpBdfygQ@mail.gmail.com>
Subject: GSoC'20 Interested Student: Adding support to Jailhouse Hypervisor
To: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="0000000000008e796905a1801954"
X-Original-Sender: prakharbansal0910@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=RXaj3rDH;       spf=pass
 (google.com: domain of prakharbansal0910@gmail.com designates
 2a00:1450:4864:20::52f as permitted sender) smtp.mailfrom=prakharbansal0910@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--0000000000008e796905a1801954
Content-Type: text/plain; charset="UTF-8"

Hello All,

My name is Prakhar Bansal and I am a graduate student in Computer
Engineering at Iowa State University, US.
I have experience with Analysing Performance of Applications running inside
multiple virtual machines hosted by the libvirt QEMU-KVM through
virt-manager.

I am interested in working on the project to develop a Libvirt driver for
the Jailhouse hypervisor. I looked into the initial attempt on the
Jailhouse driver which seems to be based on the Jailhouse command-line
interface. I am currently looking into learning and understanding the
kernel APIs for jailhouse hypervisor.
I followed the below articles mentioned by Valentine Sinitsyn to begin
learning about the Jailhouse hypervisor.

https://lwn.net/Articles/578295/
https://lwn.net/Articles/578852/

I have a few questions regarding this project, please let me know if
someone can help me out.

Thanks & Regards,
Prakhar Bansal

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAD6ScS9OfG2T3_YBUG8sRMHGVQyFvDwfm_wGtz880yTpBdfygQ%40mail.gmail.com.

--0000000000008e796905a1801954
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello All,<div><br></div><div>My name is =
Prakhar Bansal and I am a graduate=C2=A0student in Computer Engineering at =
Iowa State University, US.</div><div>I have experience with Analysing Perfo=
rmance of Applications running inside multiple virtual machines hosted by t=
he libvirt QEMU-KVM through virt-manager.<br></div><div><br></div><div>I am=
 interested in working on the project to develop a Libvirt driver for the J=
ailhouse hypervisor. I looked into the initial attempt on the Jailhouse dri=
ver which seems to be based on the Jailhouse command-line interface. I am c=
urrently looking into learning and understanding the kernel APIs for jailho=
use hypervisor.</div><div>I followed the below articles mentioned by Valent=
ine Sinitsyn to begin learning about the Jailhouse hypervisor.</div><div><b=
r></div><div><a href=3D"https://lwn.net/Articles/578295/" target=3D"_blank"=
>https://lwn.net/Articles/578295/</a><br></div><div><a href=3D"https://lwn.=
net/Articles/578852/" target=3D"_blank">https://lwn.net/Articles/578852/</a=
><br></div><div><br></div><div>I have a few questions regarding this projec=
t, please let me know if someone can help me out.</div><div><br></div><div>=
Thanks &amp; Regards,</div><div>Prakhar Bansal</div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAD6ScS9OfG2T3_YBUG8sRMHGVQyFvDwfm_wGtz880yTpBdfyg=
Q%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.g=
oogle.com/d/msgid/jailhouse-dev/CAD6ScS9OfG2T3_YBUG8sRMHGVQyFvDwfm_wGtz880y=
TpBdfygQ%40mail.gmail.com</a>.<br />

--0000000000008e796905a1801954--
