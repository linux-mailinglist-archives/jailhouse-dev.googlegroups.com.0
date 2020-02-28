Return-Path: <jailhouse-dev+bncBAABB7WN4TZAKGQE6M3ZSCQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA13173A17
	for <lists+jailhouse-dev@lfdr.de>; Fri, 28 Feb 2020 15:43:11 +0100 (CET)
Received: by mail-wr1-x437.google.com with SMTP id z15sf1436994wrw.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 28 Feb 2020 06:43:11 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1582900990; cv=pass;
        d=google.com; s=arc-20160816;
        b=DpvrOt1rrI36il39uWy8/yb27HT/9hgZpGdNAbP55mCX1shORMS23jKww/rpXcKs4z
         f+7J0q+mScZyZgBEh5xUJCaOzL7JAZbtwLT/26T99ebF6rzr5A0welK8ChLlsQPZIkE6
         pbF5dY6k+tT8/vcH1yHAjmSXOFogDeBF1B0foZQt393kZwSoDf125W5ujMU0CZmU1ZVT
         ASlw2aHCvUfydhtY/hyz4Mfh++vWMjhlk86YS9UMlqzOvakHT2R2bF3SeCmUDhVXBAKf
         L4i6oqddv8RmDV/tiSrXt0pxOZlNexK5whZFbvKyQNHnwUCODs0wpXjnM16J8RymGIfu
         5Rqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:importance:date:subject:from:to
         :mime-version:message-id:sender:dkim-signature;
        bh=/3QJouFftv4RArJxgOuYFylGL3ThqfsLd10v63rDqm4=;
        b=guzomjqBc0l5F6wE5mzgrRqilAtYqmUl7Sz5f08FKJv9yFAdptD++mEsa9gXeFQ4kb
         TRyFrABs55mFbckn+uTE0dj1/DvFzK4NPvDsw8CdOw76jLU3K1FDeVT7bsd22Smy0L0j
         FoYyZsqTpCoz7O4QRhLX4rDfc6gAIdepkE8pP/dfR0g0UypEwRZJlxvBi3zSpVvTtep/
         UagGbdPymy7wDEd5IB8p+bFQ0wfu/OtmfwHngY2uvoRTq+tUbJnGABvFLkleaewrhBRG
         plB74ENieo1sQonnDToGG67N78p0uyVTvVIOTuZMmUJbGOcK0W2JTtMUhRhfZaS7Y/ps
         AaJg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of alvaro.jover@bsc.es designates 84.88.52.34 as permitted sender) smtp.mailfrom=alvaro.jover@bsc.es
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:message-id:mime-version:to:from:subject:date:importance
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/3QJouFftv4RArJxgOuYFylGL3ThqfsLd10v63rDqm4=;
        b=BQC49y6oR6hLPLEP1O31yINGa+Henni+9BbcTyleoqMvCDCwfgbKIe73wnaYes/b4X
         WuLkEmgF7E1BHGEcgQyFMIkn105f4bY8vIPZ9BnDgTadxbXtPacmDgMBpGTyi+CFhKIH
         Dg1qGWYF93fqjdnQKepNFvU7rrc5Xi/noPAipj+jzXPj1AAfpLGinfF74IZd+w7q5t+u
         HvFbNy5WsoPhQ2C//JgSbZ5lJ+DChs9xXGB6XF6kuwUBqBNSDnE3b8AH+mMImgQEIoe2
         RHuk8kEuydRZVsgaUXGwRQArfXGBAG/Q8jgekrC5ZTMgxLl3iwixYOM7ws9zm4WndBj2
         Yyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:message-id:mime-version:to:from:subject
         :date:importance:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/3QJouFftv4RArJxgOuYFylGL3ThqfsLd10v63rDqm4=;
        b=LXM4wQrAR+iv1CpxKloaxJTkEYsIZKz7gLAGqPvJgIYTOIpCIqStlEn5VXc/Vi0C6a
         oZX9L98d7Oq4DRv6jd0q0nA1wKNgDOvoVGfsEyfuwNqSxPvPgVMk1YQ4ohVp8p7f1xKv
         LrpcYNlRYkf0Hb4/ICmZgY0iduTRJ1x7AKxzPztjbya4l0qdfEjSqzNUeIdyhasfsknq
         4/w8v3nfoFDOjgVaaJhR7Zl5kImM3iNMcvbe4LsbAv0/0cMjWcLMGwA7daVbi1++Yywt
         6f0nOrHNG4TeOMV8P9VPRRCQwxnyz83eD5cPKjVWJ41fbTUJflKjZ82zUzDcz/eSg7mj
         AQAg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU2ccctURw+qVWn4Q4ha45CyY4q8iG2uZ0S1IV1uBNIHYD4LTdB
	ydNAermlh8sKE8MPYWa8Kk8=
X-Google-Smtp-Source: APXvYqybnGYnwUCNdQQS1PRy5aEZwjzGU8nSCRy9lZu6ARPfCL96eS6wSkLot6nPpoQ0CU5SAJsC3Q==
X-Received: by 2002:a7b:cb46:: with SMTP id v6mr5446868wmj.117.1582900990666;
        Fri, 28 Feb 2020 06:43:10 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c4c6:: with SMTP id g6ls1682068wmk.0.canary-gmail; Fri,
 28 Feb 2020 06:43:10 -0800 (PST)
X-Received: by 2002:a1c:1984:: with SMTP id 126mr5341942wmz.78.1582900989972;
        Fri, 28 Feb 2020 06:43:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582900989; cv=none;
        d=google.com; s=arc-20160816;
        b=QvntE+Bm/UPzaXd2zxUm+s7p/UifD1ha5+N3lJFk2mrvAT0m2oGPijXKGXBh6fG6v2
         DnuesIBdMhI6oSgf+FzMMDTkjR9FL862E9OzYozbjJwVni4VYnTcG4MHshiE+oz4j+Q5
         GniWGTiUNQC30FkI2Lg5+OrJwilW1GtgAOryYRGbD7SWnUf7lhRfxcYfUxpwBY6EVv9u
         eMM4tLpeVP+SU/ubAvqlYtUBLdsTVfzusJIDrT70XqLWaKSFbKa0vgjHBUqXLuKeXfhO
         cHQbcqNoRv2A3JVwpgC2GALs77OLLxzkmbuPSxPKOw3Ggfc/2PkvpBoMqWymu0QGly31
         oD9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=importance:date:subject:from:to:mime-version:message-id;
        bh=8BtJkMYAEUB1RGcyfXEn5gxOgdMifSc2MROuqgQlIfg=;
        b=IxctL73UeoenlyqHdvoe3uqenkb0cJUUfVxtleB4GD29hMagf79ee/d2GZeQfS1qgJ
         jXEP//Cs7+3Euk4lALUAC9xcvY+VpFKjpg7jVWo2CXkn64g8tv5Og9mWM+hwoJBSIYtv
         pC82R/EsmSd+Fijv6y3ln/PUt1BTqxBKCXtlNSCZ7AL5V7oIQMFNTWgCT8V93+LX9LcS
         QyI6yb8F9F+7010ZacTgHX8cY3emeubYC+KfGfMt48hLLtYRekCp4VUia8A1RV4rt8un
         W/StYMK86aVQwo82U3LwOjjRIUX2plS0HzhA67Jh8L8yL7p5P2sXEe4wbOLEkPVCEPR1
         I/ng==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of alvaro.jover@bsc.es designates 84.88.52.34 as permitted sender) smtp.mailfrom=alvaro.jover@bsc.es
Received: from opsmail01.bsc.es (mao.bsc.es. [84.88.52.34])
        by gmr-mx.google.com with ESMTPS id p23si100476wma.1.2020.02.28.06.43.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Feb 2020 06:43:09 -0800 (PST)
Received-SPF: pass (google.com: domain of alvaro.jover@bsc.es designates 84.88.52.34 as permitted sender) client-ip=84.88.52.34;
Received: from localhost (localhost [127.0.0.1])
	by opsmail01.bsc.es (Postfix) with ESMTP id 811542ED6EE
	for <jailhouse-dev@googlegroups.com>; Fri, 28 Feb 2020 15:43:09 +0100 (CET)
Received: from opsmail01.bsc.es ([127.0.0.1])
 by localhost (opswc01.bsc.es [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 25375-05 for <jailhouse-dev@googlegroups.com>;
 Fri, 28 Feb 2020 15:43:08 +0100 (CET)
Received: from opswc01.bsc.es (localhost [127.0.0.1])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by opsmail01.bsc.es (Postfix) with ESMTPS id 334DBE33DB
	for <jailhouse-dev@googlegroups.com>; Fri, 28 Feb 2020 15:43:08 +0100 (CET)
Received: (from filter@localhost)
	by opswc01.bsc.es (8.13.6/8.13.6/Submit) id 01SEh8Ta028765
	for jailhouse-dev@googlegroups.com; Fri, 28 Feb 2020 15:43:08 +0100
Message-Id: <202002281443.01SEh8Ta028765@opswc01.bsc.es>
Received: from [IPv6:::ffff:192.168.88.130] (unknown [139.47.115.222])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by opsmail01.bsc.es (Postfix) with ESMTPSA id E6B502E7849
	for <jailhouse-dev@googlegroups.com>; Fri, 28 Feb 2020 15:43:07 +0100 (CET)
MIME-Version: 1.0
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
From: Alvaro Jover Alvarez <alvaro.jover@bsc.es>
Subject: Jailhouse TX2 and GPU?
Date: Fri, 28 Feb 2020 15:43:11 +0100
Importance: normal
X-Priority: 3
Content-Type: multipart/alternative;
	boundary="_BEDB928C-221B-4C06-8C9B-695A90533BA5_"
X-Copyrighted-Material: Please visit http://www.bsc.es/disclaimer
X-Virus-Scanned: amavisd-new at bsc.es
X-Original-Sender: alvaro.jover@bsc.es
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of alvaro.jover@bsc.es designates 84.88.52.34 as
 permitted sender) smtp.mailfrom=alvaro.jover@bsc.es
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

--_BEDB928C-221B-4C06-8C9B-695A90533BA5_
Content-Type: text/plain; charset="UTF-8"

Hello,

I am Alvaro Jover, former master student from BSC (Barcelona Supercomputing Center).

I found very interesting your work in the jailhouse software. I'm  replicating every single step for its integration on the Tegra TX2 and so far I got jailhouse running bare metal.

Now, I was wondering - what is the status of the project?. Did you ever manage to run anything inside jailhouse inmate using the GPU?

Best regards.

Alvaro.


http://bsc.es/disclaimer

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/202002281443.01SEh8Ta028765%40opswc01.bsc.es.

--_BEDB928C-221B-4C06-8C9B-695A90533BA5_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="UTF-8"

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta ht=
tp-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta name=
=3DGenerator content=3D"Microsoft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 3.0cm 70.85pt 3.0cm;}
div.WordSection1
	{page:WordSection1;}
--></style></head><body lang=3DES link=3Dblue vlink=3D"#954F72"><div class=
=3DWordSection1><p class=3DMsoNormal>Hello,<o:p></o:p></p><p class=3DMsoNor=
mal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>I am Alvaro Jover, former mas=
ter student from BSC (Barcelona Supercomputing Center).<o:p></o:p></p><p cl=
ass=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>I found very inte=
resting your work in the jailhouse software. I'm =C2=A0replicating every si=
ngle step for its integration on the Tegra TX2 and so far I got jailhouse r=
unning bare metal.<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p>=
<p class=3DMsoNormal>Now, I was wondering - what is the status of the proje=
ct?. Did you ever manage to run anything inside jailhouse inmate using the =
GPU?<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMso=
Normal>Best regards.<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></=
p><p class=3DMsoNormal>Alvaro.</p></div>
<br><br>
WARNING / LEGAL TEXT: This message is intended only for the use of the
individual or entity to which it is addressed and may contain
information which is privileged, confidential, proprietary, or exempt
from disclosure under applicable law. If you are not the intended
recipient or the person responsible for delivering the message to the
intended recipient, you are strictly prohibited from disclosing,
distributing, copying, or in any way using this message. If you have
received this communication in error, please notify the sender and
destroy and delete any copies you may have received.
<br><br>
<a href=3D"http://www.bsc.es/disclaimer">http://www.bsc.es/disclaimer</a>

<br></body></html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/202002281443.01SEh8Ta028765%40opswc01.bsc.es?utm_m=
edium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailho=
use-dev/202002281443.01SEh8Ta028765%40opswc01.bsc.es</a>.<br />

--_BEDB928C-221B-4C06-8C9B-695A90533BA5_--

