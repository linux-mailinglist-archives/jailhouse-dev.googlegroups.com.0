Return-Path: <jailhouse-dev+bncBCX7HWUSSQARB5HOQWJQMGQEQY4H5UA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3e.google.com (mail-qv1-xf3e.google.com [IPv6:2607:f8b0:4864:20::f3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 9698650A405
	for <lists+jailhouse-dev@lfdr.de>; Thu, 21 Apr 2022 17:25:41 +0200 (CEST)
Received: by mail-qv1-xf3e.google.com with SMTP id jz13-20020a0562140e6d00b0044c50829dbdsf1822435qvb.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 21 Apr 2022 08:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Txlwich9rg3NICspxW9B/HVDaeLKYYrIyVNgRp+qync=;
        b=oSD1pg9YxRv5POHNIjEkdSvtKVZrdnoCXW5VEFdeSGCrOiXEWw4tqpgps+dcJsP0if
         U/CPZSJFh0PwLx9YJZJYbopHcXaNuGp1N6dZnYwbYZxICHRrZZgUSTOcozWNb7aTsAUz
         FU3YR9tYYWcDLXlC1bTKN4s015ZyVlOwj1A7O1O0hUYof4cagTuxeQ3odOVkD02c7fkD
         RUD//yS4ozBpnS45QrKlN1Ie1XIvds5Av5BnuvghveqMNE9KR0diNEM1OguM3R8i5ABA
         +HjRdDRairc1PM4qANWt/40+Ovzq6vy6QXoNYxwGtuZNdbkt0Qz2+xDIB80KYo8nrHV+
         Y8aQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Txlwich9rg3NICspxW9B/HVDaeLKYYrIyVNgRp+qync=;
        b=FTpCvoApMM8PEwkRsV02UmHjPsmlJz0Aou65ge7OLd8Dv1lOFmorMhK9klU7RhTMzU
         iDoBBNQ+DHBwkHg+HOwINauYrJ4do5Axin22O4Uvsq0eHtIqbFi7EZ2Sbut5JgbbInuN
         9IKKpo0Vw5qY1sYmGtzgrQAenDFUk8tNMiDHJxusZJjdX82jL0xwbKHDl4NtORZ1mamt
         3U96EBH8e33oSVSu6R51RYaQFM2xMGH4KQQvkTztSUmh8hkvI8yDuujENduYSrdBET8F
         HP1T8/N8b0eBSPLnQcbEFiBP3VoKUuXnRmNCaM5hmbAscK73m74j/ntVh6eXKNF3gcdQ
         0Icg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Txlwich9rg3NICspxW9B/HVDaeLKYYrIyVNgRp+qync=;
        b=fT92j/zReW4EzIF4FI3e2ND3yAlRzfdlLaoX7Vk8lmMsEzIybBmYzUVRSCh3kf/5KU
         hf37mQjz5+/4oqckeu5tUCBt07hrz0epdUYQyFi7FxYBEC0oh1SZe3ir3hqKj5dGkL23
         Qi+OsC5pS5V9wxeEfzaO9ij9LYGQ4kGPjL5OtJpl6WnXov6hhy2cyNSFQQnPdimbViZs
         rRxFQvo6i9icXxJqIJu/ct7Xg+R5Ga46tqaOWN+NmSwAFxaIt0Iteocg6prXTjkbZ8u1
         8zu0s2qZR75fJwtsCgJ/GD1b7fnClK1RorN+bpvPrioJDBTq9Q9jNunsqUGk8F/ykKjU
         kfdg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531/BmA419zJj6MEO7oPB9egLtcCkFWNHKhoSku/VtIrupjOSYqt
	9wZFbQXvqABVVXevT5NLNDU=
X-Google-Smtp-Source: ABdhPJxjfa8+xi20wnb0PlSL+BTlKNSKKLdWT5u+euOafqiuM9OCyj34qQa4lOnO8DFMx/c6tlTrmA==
X-Received: by 2002:ac8:7c4c:0:b0:2f1:f09a:fdc4 with SMTP id o12-20020ac87c4c000000b002f1f09afdc4mr17658525qtv.605.1650554740464;
        Thu, 21 Apr 2022 08:25:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:4044:b0:69e:eaeb:2cd0 with SMTP id
 i4-20020a05620a404400b0069eeaeb2cd0ls1769547qko.10.gmail; Thu, 21 Apr 2022
 08:25:39 -0700 (PDT)
X-Received: by 2002:a05:620a:471f:b0:69f:1106:9cd4 with SMTP id bs31-20020a05620a471f00b0069f11069cd4mr324825qkb.239.1650554739684;
        Thu, 21 Apr 2022 08:25:39 -0700 (PDT)
Date: Thu, 21 Apr 2022 08:25:39 -0700 (PDT)
From: Jean de Bonfils <jdebonfils5@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <72df1a2c-b4de-4c3a-b1bf-ab4b5f99c072n@googlegroups.com>
Subject: Jailhouse isolation test case
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4088_1776859691.1650554739183"
X-Original-Sender: jdebonfils5@gmail.com
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

------=_Part_4088_1776859691.1650554739183
Content-Type: multipart/alternative; 
	boundary="----=_Part_4089_1261846096.1650554739183"

------=_Part_4089_1261846096.1650554739183
Content-Type: text/plain; charset="UTF-8"

Hi everyone,
I am looking for scenarios/test cases that demonstrate isolation between 
cells. 
For example, test cases that demonstrates that an inmate can't access 
peripheral devices it is not supposed to have access to or that it can't 
read memory of another cell
Do you know where I can find this?

Thank you in advance and have a nice day ; )

Jean

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/72df1a2c-b4de-4c3a-b1bf-ab4b5f99c072n%40googlegroups.com.

------=_Part_4089_1261846096.1650554739183
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,<br><div>I am looking for scenarios/test cases that demonstrate=
 isolation between cells.&nbsp;</div><div>For example, test cases that demo=
nstrates that an inmate can't access peripheral devices it is not supposed =
to have access to or that it can't read memory of another cell</div><div>Do=
 you know where I can find this?</div><div><br></div><div>Thank you in adva=
nce and have a nice day ; )<br></div><div><br></div><div>Jean</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/72df1a2c-b4de-4c3a-b1bf-ab4b5f99c072n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/72df1a2c-b4de-4c3a-b1bf-ab4b5f99c072n%40googlegroups.co=
m</a>.<br />

------=_Part_4089_1261846096.1650554739183--

------=_Part_4088_1776859691.1650554739183--
